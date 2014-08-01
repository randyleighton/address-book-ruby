class Phone

  def initialize(phone_number, type)
    @number = phone_number
    @type = type
  end

  def number
    @number
  end

  def update_number(new_number)
    @number = new_number
  end

  def update_type(new_type)
    @type = new_type
  end

  def type
    @type
  end

end
