class Teacher::FormsController < Teacher::BaseController

  def index
    require 'pry'; binding.pry
    @students = current_user.students.all
    @forms = Form.joins(:students).where(:)
  end
end
