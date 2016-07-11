class Person

  attr_reader :dob, :first_name,:surname, :email, :phone

  def initialize(f_name,s_name,dob=nil)
      @first_name = f_name.capitalize
      @surname = s_name.capitalize
      @dob = Date.parse(dob) if dob
      @email = []
      @phone = []
  end

  def fullname
    "#{@first_name} #{@surname}"
  end

  def add_email(email)
    email_regex = /\w+(?:\.\w+)?@(gmail|hotmail|outlook|live|)\.com/
    if email =~ email_regex
      @email << email
    else
      raise ArgumentError, "Please enter a valid email"
    end
  end

  def remove_email(email)
   @email.delete_at email
  end

  def add_phone(phone)
    phone_regex = /020[\d ?]{8,10}/
    if phone =~ phone_regex
      @phone << phone
    else
      raise ArgumentError, "Please enter a valid phone number"
    end
  end

  def remove_phone(phone)
   @phone.delete_at phone
  end

  #  def describe
  #     return "#{fullname} was born on #{@dob}. \n Their email addresses are: #{@email}. \n Their phone numbers are: #{@phone}"
  #  end
end
