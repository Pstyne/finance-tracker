class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
  end

  def search
    if params[:q].present?
      @friend = params[:q]
      if @friend
        respond_to do |format|
          format.js { render partial: "users/friend_result" }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Counldn't find user"
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
