class Guardian::FormsController < Guardian::BaseController

  def index
    @forms = current_user.forms.where(confirmed: 1).order(created_at: :desc)
  end

  def show
    @form = Form.find(params[:id])
    @date = @form.created_at.strftime("%F")
  end
end
