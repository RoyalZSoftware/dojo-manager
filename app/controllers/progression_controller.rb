class UserCourseAttendanceTableDataProvider
  def initialize(for_user_id)
    @user_id = for_user_id
    @date_pipe = DatePipeComponent.new
  end

  def get_items(page, limit)
    UserCourseAttendance
      .joins(:user_course, :course)
      .where('user_courses.user_id': @user_id)
      .limit(limit)
      .offset(page * limit)
      .pluck('courses.name', 'user_course_attendances.date')
      .map do |data|
        OpenStruct.new({
          course_name: data[0],
          date: @date_pipe.transform(data[1])
        })
      end
  end
end

class ProgressionController < ApplicationController
include AuthenticatedRoute
  def index
    @log_table = TableComponent.new(
      [:course_name, :date],
      UserCourseAttendanceTableDataProvider.new(current_user),
      params[:page].to_i
    )
    @log_table.define_custom_header_name_for(:course_name, "Kursname")
    @log_table.define_custom_header_name_for(:date, "Teilgenommen am")
  end
end
