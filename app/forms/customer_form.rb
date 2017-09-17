class CustomerForm < FormObject
  attr_accessor :email,
                :password,
                :motivation_letter,
                :experience,
                :skills,
                :full_name

  validates_length_of :password,
                      minimum: 12,
                      allow_nil: true
  validates_format_of :email, with:
                      /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true
  validate :email_is_unique

  def create_new_customer
    if valid?
      create_customer
    end
  end

  def update_this_customer(params, customer)
    if skills.present? && full_name.present? 
      customer.update(params)
      true
    else
      errors.add(:skills, ' missing')
      errors.add(:full_name, ' missing')
      false
    end
  end

  private

  def email_is_unique
    unless Customer.where(email: email).count == 0
      errors.add(:email, ' is taken')
    end
  end

  def create_customer
    Customer.create(
      email: email,
      password: password
    )
  end
end