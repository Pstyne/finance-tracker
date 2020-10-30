class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def friends
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:q].present?
      @friends = User.search(params[:q])
      if @friends.any?
        respond_to do |format|
          format.js { render partial: "users/friend_result" }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: "users/friend_result" }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friends name or email"
        format.js { render partial: "users/friend_result" }
      end
    end
  end
end
