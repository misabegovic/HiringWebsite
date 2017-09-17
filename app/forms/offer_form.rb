class OfferForm < FormObject
  attr_accessor :position, :salary, :type_of_contract

  validates_presence_of :position, :salary, :type_of_contract
  validates_length_of :position, :type_of_contract, minimum: 4

  def create_new_offer(current_user)
    if valid?
      create_offer(current_user)
    end
  end

  def self.update_offer(offer, current_user)
    if Applicant.find_by(offer: offer, customer: current_user).nil?
      Applicant.create(offer: offer, customer: current_user)
      CompanyMailer.send_offers_notification(offer.company, current_user, offer).deliver_later
      CustomerMailer.send_offers_notification(offer.company, current_user, offer).deliver_later
      true
    else
      false
    end
  end

  private

  def create_offer(current_user)
    Offer.create(
      company: current_user,
      position: position,
      salary: salary,
      type_of_contract: type_of_contract
    )
  end
end