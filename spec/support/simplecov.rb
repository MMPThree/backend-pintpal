require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'bin/'
  add_filter 'config/'
  add_filter 'db/'
  add_filter 'spec/' # Exclude spec directory from coverage
  add_filter 'test/' # Exclude test directory from coverage
  add_filter 'vendor/' # Exclude vendor directory from coverage
end