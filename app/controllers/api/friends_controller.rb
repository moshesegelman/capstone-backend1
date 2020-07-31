class Api::FriendsController < ApplicationController
  def index
    @friends = current_user.friends
    @pending_friends = current_user.pending_friends
    render 'index.json.jb'
  end
  
  def create
    @friend = Friend.new(
      user1_id: current_user.id,
      user2_id: params[:user2_id],
      pending: true
    ) 
    if @friend.save
      render json: {message: "friend request sent"}
    else
      render json: {error: @friend.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @friend = Friend.find(params[:id])
    if current_user.id == @friend.user2_id
      @friend.update(pending: false)
      if @friend.save
        render json: {message: "friend request accepted"}
      else
        render json: {error: @friend.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    if current_user.id == @friend.user1_id || current_user.id == @friend.user2_id
      @friend.destroy
      render json: {message: "friend has been deleted"}
    else
      render json: { errors: @friend.errors.full_messages }, status: :unauthorized
    end
  end
end