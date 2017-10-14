class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!

  protected

  def authorize!
    redirect_to root_path, alert: 'У вас нет прав на просмотр этой страницы' unless current_user.admin?
  end

end
