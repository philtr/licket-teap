module LicketTeap
  class Organization
    include HTTParty
    base_uri "#{ Base.base_uri }/organizations"

    attr_accessor :org_slug, :options

    def initialize(org_slug, options = {})
      @org_slug = org_slug
      @options ||= {}
      @options = options.merge @options
    end

    def details
      self.class.get("/#{ @org_slug }", { :query => @options })
    end

    def event(event_slug)
      Event.new(@org_slug, event_slug, @options)
    end

    def find_events_by_date(after, before = nil)
      find_by_date('events', after, before)
    end

    def find_performances_by_date(after, before = nil)
      find_by_date('performances', after, before)
    end

    def find_by_date(type, after, before = nil)
      after, before, options = after_and_before(after, before)
      self.class.get("/#{ @org_slug }/#{ type.to_s }", { :query => options })
    end

    private

    def after_and_before(after, before = nil)
      before = after.advance(:days => 1) if before.nil?
      options = {
        :dates_after => after.strftime("%Y-%m-%d%H%M"),
        :dates_before => before.strftime("%Y-%m-%d%H%M")
      }
      [after, before, options.merge(@options)]
    end

  end
end
