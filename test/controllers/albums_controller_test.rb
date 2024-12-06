require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get albums_path
    assert_response :success
  end

  test "should get show" do
    album = albums(:one) # Reference the fixture
    get album_path(album)
    assert_response :success
  end
end
