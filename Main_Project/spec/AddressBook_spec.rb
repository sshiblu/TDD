require 'spec_helper'

describe "AddressBook class" do
  it "should create an address book" do
    book = AddressBook.new
    expect(book).to be_instance_of(AddressBook)
  end

  it "should be able to add a person" do
    book = AddressBook.new
    person = Person.new("joe","bloggs","1 Jan 1999")
    book.add person
    expect(book.address).to eq [person]
  end

  it "should throw an error if add is used by someone other than a Person or FamilyMember" do
    book = AddressBook.new
    expect{book.add('blah')}.to raise_error(ArgumentError)
  end

  it "should load from a YAML file" do
    book = AddressBook.new
    book.loadyaml('./people.yml')
    expect(book.address.size).to eq 4
  end

end
