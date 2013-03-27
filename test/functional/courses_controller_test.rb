require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { course_num: @course.course_num, credits: @course.credits, crn: @course.crn, days: @course.days, instructor: @course.instructor, location: @course.location, section: @course.section, subject: @course.subject, term: @course.term, times: @course.times, title: @course.title, year: @course.year }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: { course_num: @course.course_num, credits: @course.credits, crn: @course.crn, days: @course.days, instructor: @course.instructor, location: @course.location, section: @course.section, subject: @course.subject, term: @course.term, times: @course.times, title: @course.title, year: @course.year }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
