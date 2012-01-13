module LicketTeap
  class Performance
    attr_accessor :perf_slug

    def initialize(perf_slug)
      @perf_slug = perf_slug
      puts "I am a Performance"
    end
  end
end
