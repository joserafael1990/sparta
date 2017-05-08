class UserMailer < ApplicationMailer
	def send_ticket(email, id)
		@sale = Sale.find(id)
		@details = Detail.where(:sale_id => @sale.id)
		mail(to: email, subject: 'Ticket de venta' + ' '+ @sale.client.name + ' ' + @sale.client.last_name)
	end

end
