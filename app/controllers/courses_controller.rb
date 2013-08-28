class CoursesController < ApplicationController

  FILE_NAME = "tmp/ruby_code.rb"
  
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
  	@course = Course.new()
  end

  def create
  end

  def show
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html # show.html.haml
    end
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
      if result.nil?
        match_data = code.match(/^(\w+?)\s+[\'|\"](.*)[\'|\"]/)
        case match_data[1]
        when "puts"
          result = match_data[2] + "\n" + "=> nil"
        when "print", "printf"
          result = match_data[2] + "=> nil"
        end
      end
    rescue Exception => e  
      Course.rollback_if_exception(FILE_NAME, code)
      result = e.to_s
    ensure
      return result
    end
  end
end
