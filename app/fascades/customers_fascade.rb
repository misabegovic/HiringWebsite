class CustomersFascade
  attr_accessor :customer, :customers

  def initialize(params)
    @customer = Customer.find_by(id: params[:id]) if params[:id]
    @customers = Customer.all
  end

  def search(params)
    if params[:skills]
      params[:skills].split(',').map do |skill|
        @customers = @customers.select { |c| c.skills.downcase.include? skill.downcase if c.skills }
      end
    elsif params[:name]
      @customers = @customers.select { |c| c.full_name.downcase.include? params[:name].downcase if c.full_name }
    elsif params[:email]
      @customers = @customers.select { |c| c.email.downcase.include? params[:email].downcase if c.email }
    end
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

  def customer_skills
    @customer.skills.split(',')
  end
end