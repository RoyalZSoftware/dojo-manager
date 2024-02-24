class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_courses

  def join_course(course)
    UserCourse.create(user_id: id, course_id: course.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
