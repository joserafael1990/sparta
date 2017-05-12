class UserMailer < ApplicationMailer
	def send_ticket(email, id)
		@sale = Sale.find(id)
		@details = Detail.where(:sale_id => @sale.id)
		mail(to: email, subject: 'Su solicitud en Editorial Armonia y Plenitud')
	end

end
