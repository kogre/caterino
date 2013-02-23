class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  def index
    @payment = Payment.new
    @payment.type = "cash"
    @payment.status = "requested"
    
    @requested_payments = Payment.where(:status => "requested")
    @paid_payments = Payment.where(:status => "paid")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new
    @payment.type = "cash"
    @payment.status = "requested"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
  
    @payment = Payment.new(params[:payment])
    
    customer_error = false
    
    @customer = Customer.includes(:table).where('tables.tid = ?', params[:customer_table]).where(name: params[:customer_name]).to_a.select{|c|c.active?}[0]

    if @customer.nil?
      customer_error = true
    else
      @payment.customer = @customer
      @payment.amount = @payment.customer.cost_due
    end
    

    if (not customer_error) and @payment.save
      #redirect_to print_payment_path(@payment)
    else
      @payment.errors.add(:customer, "does not exist") if customer_error
      render action: "new" 
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
  
  def print
    @payment = Payment.find(params[:id])
    render :layout => 'print'
  end
  
  def payoff
    @payment = Payment.find(params[:id])
    @payment.status = "paid"
    @payment.save
    
    redirect_to payments_path, notice: 'Payment was successfully updated.'
  end
end
