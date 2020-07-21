class Api::ConversationsController < ApplicationController
  before_action :authenticate_user 

  def index
    @conversations = current_user.conversations
    render 'index.json.jb'
  end

  def show
    user = User.find(params[:id])
    if current_user == user
      @conversation = Conversation.find(params[:id])
      render 'show.json.jb'
    else
      render json: {error: @conversation.errors.full_messages}, status: :unauthorized
    end
  end

  def create
    user = User.find(params[:id])
    if current_user == user
      @conversation = Conversation.new(
        recipient_id: params[:recipient_id],
        sender_id: current_user.id
      )

      if @conversation.save
        render 'show.json.jb'
      else
        render json: {error: @conversation.errors.full_messages}, status: :unprocessable_entity
      end
    else 
      render json: {error: @conversation.errors.full_messages}, status: :unauthorized_user 
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user == user
      @conversation = Conversation.find(params[:id])
      @conversation.destroy
      render json: {message: "conversation has been deleted"}
    else
      render json: {error: @conversation.errors.full_messages}, status: :unauthorized_user
    end
  end
end
