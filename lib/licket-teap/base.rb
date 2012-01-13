module LicketTeap
  class Base
    include HTTParty

    base_uri 'http://public-api.ticketleap.com'
    format :json

    attr_accessor :query

    def initialize(api_key = nil)
      @query = { :query => { :key => api_key } }
    end

    def organization(org_slug)
      Organization.new(org_slug, @query)
    end
  end
end
