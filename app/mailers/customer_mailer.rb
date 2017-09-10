class CustomerMailer < ApplicationMailer
  def send_offers_notification(company, customer, offer)
    @company = company
    @customer = customer
    @offer = offer
    mail to: @customer.email, bcc: 'from@example.com'
  end
end