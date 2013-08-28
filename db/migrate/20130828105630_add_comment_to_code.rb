class AddCommentToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :comment, :text
  end

  def self.down
  	remove_column :codes, :comment
  end
end
