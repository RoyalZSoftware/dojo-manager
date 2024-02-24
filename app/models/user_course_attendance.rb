class UserCourseAttendance < ApplicationRecord
  belongs_to :user_course
  belongs_to :course
end
