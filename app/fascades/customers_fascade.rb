class CustomersFascade
  attr_accessor :customer, :customers

  def initialize(params)
    @customer = Customer.find_by(id: params[:id]) if params[:id]
  end

  def search(params)
    if params[:skills]
      @customers = get_all_customers
      params[:skills].split(',').map do |skill|
        @customers = @customers.where("properties LIKE ?", "%#{skill}%")
      end
    elsif params[:name]
      @customers = get_all_customers.where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:email]
      @customers = get_all_customers.where("email LIKE ?", "%#{params[:email]}%")
    end
  end

  def get_all_customers
    Customer.all
  end

  def has_properties?
    !@customer.properties.empty?
  end

  def has_motivation_letter?
    @customer.motivation_letter.present?
  end

  def has_experience?
    @customer.experience.present?
  end

  def has_offers?
    !@customer.offers.empty?
  end

  def number_of_applications
    @customer.applicants.length
  end

  def customer_applications
    @customer.applicants.map(&:offer)
  end

  def customer_skills
    @customer.skills.split(',')
  end
end