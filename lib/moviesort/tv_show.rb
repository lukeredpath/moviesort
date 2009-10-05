require 'pathname'

module Moviesort
  class TVShow
    attr_reader :season, :episode
    
    def initialize(filename)
      @filename = filename
      @show, @identifier = *filename.split(' - ')
      @extension = File.extname(filename)
      parse_season_and_episode
    end
    
    def target_path
      show, identifier = *@filename.split(' - ')
      Pathname.new(File.join(show, "Season #{season}"))
    end
    
    def target_filename
      "#{@show.gsub(/\W/, '.')}.S%.2iE%.2i#{@extension}" % [season, episode]
    end
    
    private
    
    def parse_season_and_episode
      standard  = @identifier.match(/S(\d+)E(\d+)/i)
      alternate = @identifier.match(/(\d{1,2})x(\d+)/)
      extract_season_and_episode_from_match(standard || alternate)
    end
    
    def extract_season_and_episode_from_match(match)
      @season, @episode = *match[1..2].map { |s| s.to_i }
    end
  end
end