require 'spec_helper'

describe "Todos Class " do
  let(:todo) {Todo.new('Buy a Newspaper', "2016-06-27")}
  let(:todo2) {Todo.new('Buy a paper', "2010-06-27")}

  before (:each) do
     Todo.clear
  end

  it "should create a new todo" do
    barry=Todo.new('Buy a Newspaper', "2016-06-27")
    expect(barry).to have_attributes(title: 'Buy a Newspaper', due_date: Date.parse("2016-06-27") )
  end

  it "should have todays date as default" do
    tom=Todo.new('Buy a Newspaper')
    expect(tom.due_date).to eq Date.today #Have todays date as default
  end

  it "should print all the todos" do
    expect(Todo.all).to eq [todo,todo2]
  end

  it "should clear the todo array" do
    todo
    todo2
    expect(Todo.clear).to be_empty
  end

  it "should print the latest todo" do
    todo
    todo2
    expect(Todo.last).to eq todo2
  end
end
