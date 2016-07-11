require 'spec_helper'

describe "Person class" do

  let(:john) {Person.new("john","bloggs")}

  it "should store and return personal information" do #it is a method which takes a string and a block as its arguments
    person = Person.new("joe","bloggs","1 Jan 1999") #testing the Initialises method
    #expected outcomes
    expect(person.dob).to eq Date.new(1999,1,1) #b method converts what to understands
    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
  end

  it "should have an optional dob" do
     person = Person.new("joe","bloggs")
     expect(person.dob).to be_nil
  end

  it "should store email addresses in an array " do
    joe = Person.new("joe","bloggs")
    joe.add_email('joe@gmail.com')
    joe.add_email('joe_da_don@gmail.com')
    expect(joe.email).to eq ["joe@gmail.com", 'joe_da_don@gmail.com']
  end

  it "should remove email addresses in an array" do
    joe = Person.new("joe","bloggs")
    joe.add_email('joe@gmail.com')
    joe.remove_email(0)
    expect(joe.email).to eq []
  end

  it "should only add emails in the correct format " do
    joe = Person.new("joe","bloggs")
    expect{joe.add_email('989988989899')}.to raise_error ArgumentError
    # joe.add_email('989899898') is the action that is carried out
    #expect{joe.add_email('joe@gmail.com')joe.add_email('joe@gmail.com').to match(/\w+(?:\.\w+)?@(gmail|hotmail|outlook|live|)\.com/)
  end

  it "should store telephone numbers in an array" do
    joe = Person.new("joe","bloggs")
    joe.add_phone('020 7790 2282')
    joe.add_phone('020 7363 9393')
    expect(joe.phone).to eq ["020 7790 2282", '020 7363 9393']
  end

  it "should remove telephone numbers in an array" do
    joe = Person.new("joe","bloggs")
    joe.add_phone('020 7348 3443')
    joe.remove_phone(0)
    expect(joe.phone).to eq []
  end

  it "should only add telephone numbers in the correct format " do
    joe = Person.new("joe","bloggs")
    expect{joe.add_phone('98dfdddfsdfsdf')}.to raise_error ArgumentError
  end

  it "should display the users information" do
    joe = Person.new("joe","bloggs","1 Jan 1990")
    joe.add_phone('0794 666 2131')
    joe.add_phone('0757 250 3790')
    joe.add_email('joe@gmail.com')
    expect(joe.describe).to eq ("Joe Bloggs was born on 1990-01-01.\n Their email addresses are: [\"joe@gmail.com\"]. \n Their phone numbers are: [\"0794 666 2131\",\"0757 250 3790\"]")
  end

end
