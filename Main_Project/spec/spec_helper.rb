require 'rspec'#calls in RSpec
require 'watir'
require 'pry'
require './application' #Calls in the application file

RSpec.configure do |config| # Initialise the ish
  config.color = true
  config.tty = true
  config.formatter = :documentation # adds colour
end
