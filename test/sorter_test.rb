require 'test_helper'
require 'moviesort/sorter'

class SorterTest < Test::Unit::TestCase
  
  def setup
    FakeFS.activate!
    @output_path   = "/output"
    @download_path = "/downloads"
    FileUtils.mkpath(@output_path)
    FileUtils.mkpath(@download_path)
  end
  
  def teardown
    FakeFS::FileSystem.clear
    FakeFS.deactivate!
  end

  context "TV show sorter" do
    setup do
      @sorter = Moviesort::Sorter::TV.new(@output_path)
    end

    should "move a given TV show to its target path under the root path" do
      FileUtils.touch("/downloads/The Sopranos - S02E04.avi")
      @sorter.sort_file("/downloads/The Sopranos - S02E04.avi")
      assert File.exist?("/output/The Sopranos/Season 2/The.Sopranos.S02E04.avi")
    end
    
    should "sort all valid movie files in a given directory" do
      %w{avi mp4 mov mkv}.each { |ext| FileUtils.touch("/downloads/movie.#{ext}") }
      @sorter.expects(:sort_file).with("/downloads/movie.avi")
      @sorter.expects(:sort_file).with("/downloads/movie.mkv")
      @sorter.expects(:sort_file).with("/downloads/movie.mp4")
      @sorter.expects(:sort_file).with("/downloads/movie.mov")
      @sorter.sort_directory(@download_path)
    end
    
    should "ignore non-valid movie files in a given directory" do
      FileUtils.touch("/downloads/movie.mp3")
      @sorter.expects(:sort_file).with("/downloads/movie.mp3").never
      @sorter.sort_directory(@download_path)
    end
  end  
  
end
