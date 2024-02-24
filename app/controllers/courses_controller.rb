class CoursesTableDataSource
  def get_items(page, limit)
    Course.limit(limit)
      .offset(page * limit)
      .map do |course|
        OpenStruct.new({
          id: course.id,
          name: course.name,
          members_count: UserCourse.where(course_id: course.id).count
        })
      end
  end
end

class CoursesController < ApplicationController
  include AuthenticatedRoute

  def index
    @table = TableComponent.new(
      [:name, :members_count],
      CoursesTableDataSource.new,
      params[:page].to_i,
      1
    )
    @table.define_custom_header_name_for(:members_count, "Mitglieder")
    @table.define_link_for_column :name do |course|
      course_path(course.id)
    end
  end

  def show
    @course = Course.find(params[:id])
  end
end
