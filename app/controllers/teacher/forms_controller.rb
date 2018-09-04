class Teacher::FormsController < Teacher::BaseController

  def index
    @forms = current_user.forms
  end

  def confirm
    Form.update(params[:form_id], confirmed: params[:confirmed])
    redirect_to teacher_forms_path
  end
end
