class AddFinishedToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :finished, :bollean
  end

  def self.down
  	remove_column :codes, :finished
  end
end
