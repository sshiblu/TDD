class AddressBook
  attr_accessor :address
  def initialize
    @address = []
  end

  def add(someone)
    if someone.is_a? Person || FamilyMember #makes sure to check if it is of type class
      @address << someone
    else
      raise ArgumentError, "Argument must be of type Person or FamilyMember"
    end
  end

  def loadyaml(file)
    a = YAML.load(File.open(file))
    a["people"].each do |p|
    person = Person.new(p['f_name'],p['s_name'])
    @address << person
    end
  end
end
