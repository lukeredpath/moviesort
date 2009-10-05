require 'moviesort/tv_show'

module Moviesort
  module Sorter
    class TV
      def initialize(output_dir)
        @output_dir = output_dir
      end
      
      def sort_file(path)
        tv_show = Moviesort::TVShow.new(File.basename(path))
        target_path = File.join(@output_dir, tv_show.target_path)
        FileUtils.mkdir_p(target_path)
        FileUtils.mv(path, File.join(target_path, tv_show.target_filename))
      end
    end
  end
end
