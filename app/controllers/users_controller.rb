class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
  end

  def search
    render json: params[:q]
  end
end
