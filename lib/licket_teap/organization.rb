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
      before = after.advance(:days => 1) if before.nil?
      options = {
        :dates_after => after.strftime("%Y-%m-%d"),
        :dates_before => before.strftime("%Y-%m-%d")
      }.merge @options
      puts options
      self.class.get("/#{ @org_slug }/events", { :query => options })
    end
  end
end
