require "test_helper"

class TeacherProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_profiles_index_url
    assert_response :success
  end
end
