class CreateCourses < ActiveRecord::Migration
  def self.up
  	create_table :courses do |course|
  		course.string :name
  		course.text :comment
      	
      	course.timestamps
  	end
  end

  def self.down
  	drop_table :courses
  end
end
