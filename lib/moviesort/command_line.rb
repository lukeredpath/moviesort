require 'trollop'
require 'moviesort/sorter'

module Moviesort
  class CommandLine
    def self.parse(options)
      new(options.split)
    end
    
    MOVIE_EXTENSIONS = %w{avi mkv mov mp4}
    
    def initialize(argv = ARGV)
      @options = Trollop.options(argv) do
        banner <<-EOS.gsub(/^ {8}/, '')
        Moviesort is a script to sort and file away your TV shows and movies

        Usage: moviesort [options]
        EOS

        opt :source, "Source directory", :default => '.'
        opt :target, "Target directory", :default => '.'
      end
    end
    
    def run
      sorter = Sorter::TV.new(@options[:target])
      movie_files = Dir[File.join(@options[:source], '*')].select do |file|
        MOVIE_EXTENSIONS.include?(File.extname(file)[1..-1])
      end
      movie_files.each do |file|
        sorter.sort_file(file)
      end
    end
  end
end
