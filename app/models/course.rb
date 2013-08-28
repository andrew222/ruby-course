class Course < ActiveRecord::Base
	attr_accessible :name, :comment
	has_many :codes, dependent: :destroy
  def test
  end

  def self.write_ruby_code_to_file(file_name, code)
  	if code == "clear"
			File.open(file_name, "w") { |file| file.truncate(0) }
		else
			File.open(file_name, "a") { |file| file << code + "\n" }
		end
  end

  def self.rollback_if_exception(file_name, code)
  	open(file_name, 'r') do |file|
		  open(file_name + '.tmp', 'w') do |file_tmp|
		    file.each_line do |line|
		      file_tmp.write(line) unless line == code + "\n"
		    end
		  end
		end
		FileUtils.mv file_name + '.tmp', file_name
  end
end
