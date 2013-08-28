class Code < ActiveRecord::Base
	belongs_to :course
  attr_accessible :content, :finished, :comment
end
