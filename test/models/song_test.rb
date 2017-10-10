require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "should not save song wihtout data" do
    song = Song.new
    assert_not song.save
  end

  
end
