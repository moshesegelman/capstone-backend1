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
      if Conversation.exists?(recipient_id: params[:recipient_id], sender_id: current_user.id )
        @conversation = Conversation.find_by(recipient_id: params[:recipient_id], sender_id: current_user.id )
        render 'show.json.jb'
      elsif Conversation.exists?(recipient_id: current_user.id, sender_id: params[:recipient_id])
        @conversation = Conversation.find_by(recipient_id: current_user.id, sender_id: params[:recipient_id])
        render 'show.json.jb'
      else
        @conversation = Conversation.new(
          recipient_id: params[:recipient_id],
          sender_id: current_user.id
        )
        if @conversation.save
          # ActionCable.server.broadcast "messages_channel", {
          #   id: @conversation.id,
          #   sender_id: @conversation.sender.id,
          #   recipient_id: @conversation.recipient.id
          # }
          render 'show.json.jb'
        else
          render json: {error: @conversation.errors.full_messages}, status: :unprocessable_entity
        end
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
