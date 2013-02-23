class OrderNotesController < ApplicationController
  
  # GET /order_notes
  # GET /order_notes.json
  def index
    @order_notes = OrderNote.order("created_at DESC").paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_notes }
    end
  end

  # GET /order_notes/1
  # GET /order_notes/1.json
  def show
    @order_note = OrderNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_note }
    end
  end

  # GET /order_notes/new
  # GET /order_notes/new.json
  def new
    @order_note = OrderNote.new
    ProductGroup.order(:ordering).each do |pg|
      pg.products.actives.order(:pid).each do |p|
        @order_note.order_note_components.build(:product => p, :amount => 0)
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_note }
    end
  end

  # GET /order_notes/1/edit
  def edit
    @order_note = OrderNote.find(params[:id])
    ProductGroup.order(:ordering).each do |pg|
      pg.products.actives.order(:pid).each do |p|
        @order_note.order_note_components.build(:product => p, :amount => 0) if @order_note.order_note_components.where(:product_id => p.id).first.nil?
      end
    end
  end

  # POST /order_notes
  # POST /order_notes.json
  def create    
    table_error = false
    
    @table = Table.where(:tid => params[:customer_table]).first
    if not @table.nil?
      @customers = @table.customers.where(:name => params[:customer_name])
      if @customers.empty?
        params[:order_note][:customer_attributes] = {:table_id => @table.id, :name => params[:customer_name]}
      else
        params[:order_note][:customer_id] = @customers.first.id
      end
    else #if table doesn't exist
      table_error = true
    end 
    
    @order_note = OrderNote.new(params[:order_note])

    respond_to do |format|
      if (not table_error) and @order_note.save
        format.html { redirect_to new_order_note_path, notice: 'Order note was successfully created.' }
        format.json { render json: @order_note, status: :created, location: @order_note }
      else
        @order_note.errors.add(:customer, "Table does not exist") if table_error
        format.html { render action: "new" }
        format.json { render json: @order_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_notes/1rail
  # PUT /order_notes/1.json
  def update
    @order_note = OrderNote.find(params[:id])

    respond_to do |format|
      if @order_note.update_attributes(params[:order_note])
        format.html { redirect_to @order_note, notice: 'Order note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_notes/1
  # DELETE /order_notes/1.json
  def destroy
    @order_note = OrderNote.find(params[:id])
    @order_note.destroy

    respond_to do |format|
      format.html { redirect_to order_notes_url }
      format.json { head :no_content }
    end
  end
  
end
