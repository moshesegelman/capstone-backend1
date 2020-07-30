class Api::ConversationsController < ApplicationController
  before_action :authenticate_user 

  def index
    @conversations = current_user.conversations
    render 'index.json.jb'
  end

  def show
    if current_user 
      @conversation = Conversation.find(params[:id])
      render 'show.json.jb'
    else
      render json: {error: @conversation.errors.full_messages}, status: :unauthorized
    end
  end

  def create
    if current_user 
      @conversation = Conversation.new(
        recipient_id: params[:recipient_id],
        sender_id: current_user.id
      )

      ActionCable.server.broadcast "messages_channel", {
        id: @conversation.id,
        sender_id: @conversation.sender.id,
        recipient_id: @conversation.recipient.id
      }

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
    if current_user 
      @conversation = Conversation.find(params[:id])
      @conversation.destroy
      render json: {message: "conversation has been deleted"}
    else
      render json: {error: @conversation.errors.full_messages}, status: :unauthorized_user
    end
  end
end
