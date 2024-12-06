require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artists_path
    assert_response :success
  end

  test "should get show" do
    artist = artists(:one)
    get artist_path(artist)
    assert_response :success
  end
end
