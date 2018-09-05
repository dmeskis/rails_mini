class StudentsController < ApplicationController

  def index
    @students = current_user.students
  end

  def add_parent_student_relation

  end

end
