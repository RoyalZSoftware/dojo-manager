class Course < ApplicationRecord
  has_many :user_course_attendances
end
