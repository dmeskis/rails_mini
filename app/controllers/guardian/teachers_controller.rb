class Guardian::TeachersController < Guardian::BaseController

  def index
    @teachers = []
    current_user.students.map do |student|
      student.users.map do |user|
        if user.role == "teacher"
          @teachers << user
        end
      end
    end
  end
end
