class Teacher::GuardiansController < Teacher::BaseController

  def index
    @guardians = []
    current_user.students.map do |student|
      student.users.map do |user|
        if user.role == "guardian"
          @guardians << user
        end
      end
    end
  end

end
