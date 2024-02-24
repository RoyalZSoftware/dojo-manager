class CreateUserCourseAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :user_course_attendances do |t|
      t.integer :user_course_id
      t.integer :course_id
      t.datetime :date

      t.timestamps
    end
  end
end
