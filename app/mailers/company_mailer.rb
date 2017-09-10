class CompanyMailer < ApplicationMailer
  def send_update_notification(company)
    @company = company
    mail to: @company.email, bcc: 'from@example.com'
  end

  def send_offers_notification(company, customer, offer)
    @company = company
    @customer = customer
    @offer = offer
    mail to: @company.email, bcc: 'from@example.com'
  end
end