module LicketTeap
  class Event
    attr_accessor :event_slug

    def initialize(event_slug)
      @event_slug = event_slug
      puts "I am an event"
    end

    def performances
    end

    def performance(perf_slug)
      Performance.new(perf_slug)
    end
  end
end
