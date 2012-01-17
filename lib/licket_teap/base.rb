module LicketTeap
  class Base
    include HTTParty

    base_uri 'http://public-api.ticketleap.com'
    format :json

    attr_accessor :options

    def initialize(api_key = nil)
      @options = { :key => api_key }
    end

    def organization(org_slug)
      Organization.new(org_slug, @options)
    end
  end
end
