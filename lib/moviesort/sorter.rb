require 'moviesort/tv_show'

module Moviesort
  module Sorter
    class TV
      VALID_FILE_TYPES = %w{avi mkv mov mp4}
      
      def initialize(output_dir)
        @output_dir = output_dir
      end
      
      def sort_directory(path)
        movie_files_in_directory(path).each do |file|
          sort_file(file)
        end
      end
      
      def sort_file(path)
        if tv_show = Moviesort::TVShow.parse(File.basename(path))
          target_path = File.join(@output_dir, tv_show.target_path)
          FileUtils.mkdir_p(target_path)
          FileUtils.mv(path, File.join(target_path, tv_show.target_filename))
        end
      end
      
      private
      
      def movie_files_in_directory(path)
        Dir[File.join(path, '*')].select do |file|
          VALID_FILE_TYPES.include?(File.extname(file)[1..-1])
        end
      end
    end
  end
end
