require 'test_helper'
require 'moviesort/tv_show'

class TvShowTest < Test::Unit::TestCase
  
  context "A TV show" do
    setup do
      @tv_show = Moviesort::TVShow.new("The.Sopranos.102.avi", "The Sopranos", season = 1, episode = 2)
    end
  
    should "have a target path based on the show name and season" do
      assert_equal Pathname.new("The Sopranos/Season 1"), @tv_show.target_path
    end
    
    should "have a filename based on the show name and season with the original file extension" do
      assert_equal "The.Sopranos.S01E02.avi", @tv_show.target_filename
    end
  end
  
  context "When parsing" do
    should "handle file in the format SHOW NAME - SXXEXX.xxx" do
      @tv_show = Moviesort::TVShow.parse("The Sopranos - S01E02.avi")
      assert_equal "The Sopranos", @tv_show.show
      assert_equal 1, @tv_show.season
      assert_equal 2, @tv_show.episode
    end
    
    should "handle file in the format SHOW NAME - sXXeXX.xxx" do
      @tv_show = Moviesort::TVShow.parse("The Sopranos - s01e02.avi")
      assert_equal "The Sopranos", @tv_show.show
      assert_equal 1, @tv_show.season
      assert_equal 2, @tv_show.episode
    end
    
    should "handle file in the format SHOW NAME - SxE.xxx" do
      @tv_show = Moviesort::TVShow.parse("The Sopranos - 1x02.avi")
      assert_equal "The Sopranos", @tv_show.show
      assert_equal 1, @tv_show.season
      assert_equal 2, @tv_show.episode
    end
    
    should "handle file in the format SHOW.NAME.XYY.xxx" do
      @tv_show = Moviesort::TVShow.parse("The.Sopranos.102.avi")
      assert_equal "The Sopranos", @tv_show.show
      assert_equal 1, @tv_show.season
      assert_equal 2, @tv_show.episode                  
    end
    
    should "return nil if format is unrecognized" do
      assert_nil Moviesort::TVShow.parse("dont know what to do with this!.txt")
    end
  end
  
end