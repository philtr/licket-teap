module LicketTeap
  class Event
    include HTTParty
    base_uri "#{ Organization.base_uri }/#{org_slug}/events"
    
    attr_accessor :org_slug, :event_slug, :options

    def initialize(org_slug, event_slug, options = {})
      @org_slug = org_slug
      @event_slug = event_slug
      @options ||= {}
      @options = options.merge @options
    end

    def details
      self.class.get("/#{ @event_slug }", { :query => @options })
    end

    def performance(perf_slug)
      Performance.new(org_slug, event_slug, perf_slug, @options)
    end

  end
end
