class StudentsController < ApplicationController

  def index
    @students = current_user.students
  end

end
