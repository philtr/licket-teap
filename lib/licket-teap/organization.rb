module LicketTeap
  class Organization
    include HTTParty

    attr_accessor :org_slug, :query
    base_uri "#{ Base.base_uri }/organizations/"

    def initialize(org_slug, query)
      @org_slug = org_slug
      @query = query
    end

    def details
      self.class.get("/#{ @org_slug }", @query)
    end

    def events
    end

    def event(event_slug)
      Event.new(event_slug)
    end
  end
end
