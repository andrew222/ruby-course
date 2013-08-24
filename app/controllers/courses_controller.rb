class CoursesController < ApplicationController

  FILE_NAME = "tmp/ruby_code.rb"
  
  def index
    @cousrs = Course.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
  	@course = Course.new()
  end

  def create
  end

  def excute_code
    code = params["code"].split(/\n/).last
    Course.write_ruby_code_to_file(FILE_NAME, code)
    if File.exist?(FILE_NAME)
      codes = File.open(FILE_NAME).read
      result = excute_result(codes, code)
    else
      result = ""
    end
    respond_to do |format|
      format.html
      format.json { render json: { success: true, result: result } }
    end
  end

  def excute_result(codes, code)
    begin 
      result = eval(codes)
    rescue Exception => e  
      Course.rollback_if_exception(FILE_NAME, code)
      result = e.to_s
    ensure
      return result
    end
  end
end
