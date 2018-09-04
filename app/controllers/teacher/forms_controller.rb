class Teacher::FormsController < Teacher::BaseController

  def index
    @forms = current_user.forms.order(created_at: :desc)
  end

  def confirm
    Form.update(params[:form_id], confirmed: params[:confirmed])
    redirect_to teacher_forms_path
  end

  def destroy
    @form = Form.find(params[:id])
    if @form.destroy
      flash[:success] = "Form for #{@form.student.first_name} #{@form.student.last_name} for #{@form.created_at} destroyed!"
      redirect_to teacher_forms_path
    else
      redirect_to teacher_forms_path
    end
  end
end
