class CoursesController < ApplicationController
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
    file_name = "tmp/ruby_code.rb"
    code = params["code"].split(/\n/).last
    Course.write_ruby_code_to_file(file_name, code)
    if File.exist?(file_name)
      codes = File.open(file_name).read
      result = excute_result(codes)
    else
      result = ""
    end
    respond_to do |format|
      format.html
      format.json { render json: { success: true, result: result } }
    end
  end

  def excute_result(code)
    begin 
      result = eval(code)
    rescue Exception => e  
      result = e.to_s
    ensure
      return result
    end
  end
end
