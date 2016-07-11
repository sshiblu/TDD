class Todo
  attr_accessor :title, :due_date
  @@class_array = []

  def self.all
    return @@class_array
  end

  def self.clear
    @@class_array = []
  end

  def self.last
    @@class_array.last
  end

  def initialize (title, due_date=Date.today)
    @title = title
    if due_date.is_a? String
      @due_date = Date.parse(due_date)
    elsif due_date.is_a? Date
      @due_date = due_date
    else
      raise ArgumentError, 'Please enter a String or a Date'
    end
    @@class_array << self
  end
end
