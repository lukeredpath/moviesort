require 'test_helper'
require 'moviesort/tv_show'

class TvShowTest < Test::Unit::TestCase
  
  context "A TV show file in the format SHOW NAME - SXXEXX.xxx" do
    setup do
      @tv_show = Moviesort::TVShow.new("The Sopranos - S01E01.avi")
    end

    should "have a target path based on the show name and season" do
      assert_equal Pathname.new("The Sopranos/Season 1"), @tv_show.target_path
    end
    
    should "replace spaces and other characters with periods" do
      assert_equal "The.Sopranos.S01E01.avi", @tv_show.target_filename
    end
  end
  
  context "A TV show file in the format SHOW NAME - sXXeXX.xxx" do
    setup do
      @tv_show = Moviesort::TVShow.new("The Sopranos - s01e01.avi")
    end

    should "have a target path based on the show name and season" do
      assert_equal Pathname.new("The Sopranos/Season 1"), @tv_show.target_path
    end
    
    should "replace spaces and other characters with periods" do
      assert_equal "The.Sopranos.S01E01.avi", @tv_show.target_filename
    end
  end
  
  context "A TV show file in the format SHOW NAME - SxE.xxx" do
    setup do
      @tv_show = Moviesort::TVShow.new("The Sopranos - 1x01.avi")
    end

    should "have a target path based on the show name and season" do
      assert_equal Pathname.new("The Sopranos/Season 1"), @tv_show.target_path
    end
    
    should "use standard naming scheme replacing spaces and other characters with periods" do
      assert_equal "The.Sopranos.S01E01.avi", @tv_show.target_filename
    end
  end
  
end