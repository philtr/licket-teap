require 'bundler/setup'

Bundler.require

$:.unshift File.expand_path(File.dirname(__FILE__))

module LicketTeap
  autoload :Base, 'licket-teap/base'
  autoload :Organization, 'licket-teap/organization'
  autoload :Event, 'licket-teap/event'
  autoload :Performance, 'licket-teap/performance'

  def self.new(api_key)
    Base.new(api_key)
  end
end
