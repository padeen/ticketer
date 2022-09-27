class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!

  def index
  end

  private
    def authorize_admin!
      authenticate_user!

      unless current_user.admin?
        render json: "Not authorized"
      end
    end
end
