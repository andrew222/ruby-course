class AddCourseIdToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :course_id, :integer
  end

  def self.down
  	remove_column :codes, :course_id
  end
end
