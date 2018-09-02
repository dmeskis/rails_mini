class Teacher::StudentsController < Teacher::BaseController

  def index
  end

  def new
    require 'pry'; binding.pry
    @teacher = current_user
    @student = @teacher.students.new
  end

end
