require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get songs_path
    assert_response :success
  end

  test "should get show" do
    song = songs(:one) 
    get song_path(song)
    assert_response :success
  end
end
