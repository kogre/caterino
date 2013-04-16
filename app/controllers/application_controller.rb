class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def parse_customer_selection_string str
    parsed_str = str.split(" ",2)
    
    tid = parsed_str[0].to_i
    if tid == 0 then raise "Invalid customer selection string" end
    name = parsed_str[1]
    
    {:tid => tid, :name => name}
  end
  
end
