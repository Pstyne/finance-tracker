class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = "You are now following #{friend.first_name}"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to friends_path
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to friends_path
  end
end
