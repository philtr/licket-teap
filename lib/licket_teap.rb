require 'bundler/setup'
Bundler.require

$:.unshift File.dirname(__FILE__)

module LicketTeap
  autoload :Base,         "licket_teap/base.rb"
  autoload :Organization, "licket_teap/organization.rb"
  autoload :Event,        "licket_teap/event.rb"
  autoload :Performance,  "licket_teap/performance.rb"

  def self.new(api_key)
    Base.new(api_key)
  end
end
