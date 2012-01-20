require 'bundler/setup'
Bundler.require

$:.unshift File.dirname(__FILE__)
require "licket_teap/base.rb"
require "licket_teap/organization.rb"
require "licket_teap/event.rb"
require "licket_teap/performance.rb"

module LicketTeap
  def self.new(api_key)
    Base.new(api_key)
  end
end
