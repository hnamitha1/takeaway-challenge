class Order
	
	attr_reader :total_price,:items

	def initialize
    @items = Hash.new(0)
	end

	def order(dish,quantity=1)
		#basket = [dish xquantity]
	  "#{quantity}x  #{dish}(s) added to your basket." 
	   @items[dish] += quantity
	end
	 
	def complete_order(total_price)
    send_text("Thank you for your order: £#{total_price}")
  end

  def send_text(message)
  	account_sid = 'ACa4cf08b22ebab768c156ad454eaccb71' 
	  auth_token = '3321406ad1dfa603ec0195d363a5fbef' 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+441625800296', 
			:to => "+447817019706", 
			:body => "#{message}",  
		})
	end
end