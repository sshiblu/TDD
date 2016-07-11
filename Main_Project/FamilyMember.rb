class FamilyMember < Person

  attr_accessor :relationship

  def initialize (f_name, s_name, dob=nil, relationship)
    @relationship = relationship
    super(f_name, s_name, dob=nil)
  end
end
