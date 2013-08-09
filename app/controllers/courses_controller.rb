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
    code = params["code"].split('\n').last
    result = excute_result(code)
    p result
    respond_to do |format|
      format.html
      format.json { render json: { success: true, result: result } }
    end
  end

  def excute_result(code)
    begin 
      result = eval(code)
    rescue Exception => e  
      result = e
      return result.to_s
    end
    return result
  end
end
