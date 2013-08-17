class CoursesController < ApplicationController
  def index
    @cousrs = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json @courses
    end
  end

  def new
  	@course = Course.new()
  end

  def create
  end

  def ruby_code_input_test
    respond_to do |format|
      format.html
    end
  end

  def excute_code
    code = params["code"].split(/\n/).last
    result = excute_result(code)
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
      exit 1
    ensure
      return result
    end
  end
end
