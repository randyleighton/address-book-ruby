class Contact

  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end
  def save
    @@all_contacts << self
  end

  def initialize(name)
    @name = name
    @phone_numbers = []
  end

  def add_phone_number(phone)
    @phone_numbers << phone
  end

  def phone_numbers
    @phone_numbers
  end

  def set_address(address)
    @address = address
  end

  def set_phone(phone)
    @phone = phone
  end

  def set_email(email)
    @email = email
  end

  def name
    @name
  end

  def address
    @address
  end

  def phone
    @phone
  end

  def email
    @email
  end


end
