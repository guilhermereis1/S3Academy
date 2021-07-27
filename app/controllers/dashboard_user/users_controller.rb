class DashboardUser::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    user_id = params[:user_id].to_i

    if user_id.present? && user_id != 0 then
      @user = User.find(user_id)
    end
  end

  def register_new_user
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    if email.present? && password.present? && password_confirmation.present? then
      @user = User.create(email: email, password: password, password_confirmation: password_confirmation)

      respond_to do |format|
        if @user.save
          format.html { redirect_to dashboard_user_view_user_path(@user.id), notice: "Usuário cadastrado com sucesso!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_user_create_user_path, notice: "Por favor preencha todos os Campos!" }
      end
    end
  end

  def delete_user
    user_id = params[:user_id].to_i
    if user_id.present? && user_id != 0 then
      user = User.find(user_id)
      user.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_user_users_index_path, notice: "Usuário deletado com sucesso!" }
      end
    end
  end
end
