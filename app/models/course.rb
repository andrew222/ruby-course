class Course < ActiveRecord::Base
  def test
  end

  def self.write_ruby_code_to_file(file_name, code)
		File.open(file_name, "a") { |file| file << code + "\n" }
  end

end
