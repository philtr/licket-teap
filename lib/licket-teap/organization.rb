module LicketTeap
  class Organization
    include HTTParty
    base_uri "#{ Base.base_uri }/organizations"

    attr_accessor :org_slug, :query

    def initialize(org_slug, query = {})
      @org_slug = org_slug
      @query ||= {}
      @query = query.merge @query
    end

    def details
      self.class.get("/#{ @org_slug }", { :query => @query })
    end

    def event(event_slug)
      Event.new(org_slug, event_slug, @query)
    end
  end
end
