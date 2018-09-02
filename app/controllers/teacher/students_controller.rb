class Teacher::StudentsController < Teacher::BaseController

  def index
  end

  def new
    @teacher = User.find(session[:user_id])
    @student = Student.new
  end

end
