require 'rspec'#calls in RSpec
require './application.rb' #Calls in the application file

RSpec.configure do |config| # Initialise the ish
  config.color = true
  config.tty = true
  config.formatter = :documentation # adds colour
end
