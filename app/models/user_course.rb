class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :user_course_attendances

  def log(date)
    UserCourseAttendance.create(
      course_id: course_id,
      date: date,
      user_course_id: id
    )
  end
end
