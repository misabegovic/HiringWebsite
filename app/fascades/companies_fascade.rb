class CompaniesFascade
  attr_accessor :company, :companies, :errors

  def initialize(params)
    @company = Company.find_by(id: params[:id]) if params[:id]
    @companies = Company.all
  end

  def update(params)
    if @company.update(params)
      CompanyMailer.send_update_notification(@company).deliver_later
      true
    else
      @errors = @company.errors.full_messages
      false
    end
  end

  def search(params)
    if params[:title]
      @companies = @companies.select { |c| c.title.downcase.include? params[:title].downcase if c.title }
    elsif params[:contact_email]
      @companies = @companies.select { |c| c.contact_email.downcase.include? params[:contact_email].downcase if c.contact_email }
    end
  end

  def has_properties?
    !@company.properties.empty?
  end

  def has_offers?
    !@company.offers.empty?
  end
end