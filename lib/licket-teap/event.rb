module LicketTeap
  class Event
    include HTTParty

    attr_accessor :org_slug, :event_slug, :query

    def initialize(org_slug, event_slug, query = {})
      self.class.base_uri "#{ Organization.base_uri }/#{org_slug}/events"

      @org_slug = org_slug
      @event_slug = event_slug
      @query ||= {}
      @query = query.merge @query
    end

    def details
      self.class.get("/#{ @event_slug }", { :query => @query })
    end

    def performance(perf_slug)
      Performance.new(org_slug, event_slug, perf_slug, @query)
    end
  end
end
