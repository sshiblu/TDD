require 'spec_helper'

describe "FamilyMember class" do #dont test inheritance as you might change it while testing

   it "should be able to store and return the relationship " do #it is a method which takes a string and a block as its arguments
     john = FamilyMember.new("joe","bloggs","1 Jan 1999","Father") #testing the Initialises method
     #expected outcomes
     expect(john.relationship).to eq "Father"
     end
 end
