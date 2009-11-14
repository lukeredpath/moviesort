require 'pathname'

module Moviesort
  class TVShow
    attr_reader :show, :season, :episode
    
    def initialize(filename, show, season, episode)
      @show = show
      @season = season
      @episode = episode
      @extension = File.extname(filename)
    end
    
    def self.parse(filename)
      parser = Parser.new(filename)
      new(filename, *parser.parse)
    end
    
    def target_path
      Pathname.new(File.join(show, "Season #{season}"))
    end
    
    def target_filename
      "#{@show.gsub(/\W/, '.')}.S%.2iE%.2i#{@extension}" % [season, episode]
    end
    
    private
    
    class Parser
      def initialize(filename)
        @filename = sanitize(filename)
      end
      
      def parse
        patterns = [
          /(.*)\sS(\d+)E(\d+)/i, 
          /(.*)\s(\d{1,2})x(\d+)/,
          /(.*)\s(\d{1})(\d{2})/
        ]
        match = patterns.map { |regex| @filename.match(regex) }.compact.first
        extract_data_from_pattern_match(match)
      end

      def extract_data_from_pattern_match(match)
        [match[1], *match[2..3].map { |s| s.to_i }]
      end

      def sanitize(filename)
        filename.gsub(/\./, ' ').gsub(/-/, ' ').squeeze(' ')
      end
    end
  end
end