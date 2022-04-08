class DashboardUser::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  def index
    @students = Student.all.order(created_at: :desc)
  end

  def show
    student_id = params[:student_id]

    if student_id.present? then
      @student = Student.find(student_id)
      @subscriptions = Subscription.where(student_id: student_id)
    end
  end

  def register_new_student
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    if email.present? && password.present? && password_confirmation.present? then
      @student = Student.create(email: email, password: password, password_confirmation: password_confirmation)

      respond_to do |format|
        if @student.save
          format.html { redirect_to dashboard_user_view_student_path(@student.id), notice: "Usuário cadastrado com sucesso!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_user_create_student_path, notice: "Por favor preencha todos os Campos!" }
      end
    end
  end

  def update_student
    student_id = params[:student_id]

    @student = Student.find(student_id)
  end

  def update_status_student
    student_id = params[:student_id]
    student = Student.find(student_id)

    if student.status == "active" then
      student.update(status: "inactive")
    else
      student.update(status: "active")
    end
    redirect_to dashboard_user_users_index_path
  end

  def save_student_updated
    student_id = params[:student_id]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    @student = Student.find(student_id)
    @student.update(
      password: password,
      password_confirmation: password_confirmation
    )

    respond_to do |format|
      if @student.save
        format.html { redirect_to dashboard_user_view_student_path(@student.id), notice: "Usuário atualizado com sucesso!" }
      end
    end
  end

  def delete_student
    student_id = params[:student_id]
    if student_id.present? then
      student = Student.find(student_id)
      student.destroy
      
      respond_to do |format|
        format.html { redirect_to dashboard_user_users_index_path, notice: "Usuário deletado com sucesso!" }
      end
    end
  end
end
