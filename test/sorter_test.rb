require 'test_helper'
require 'moviesort/sorter'

class SorterTest < Test::Unit::TestCase
  
  def setup
    @output_path   = "/output"
    @download_path = "/downloads"
    FileUtils.mkpath(@output_path)
    FileUtils.mkpath(@download_path)
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
  end  
  
end
