class Api::MessagesController < ApplicationController

  before_action :authenticate_user, except:[:show] 

  def show
    @message = Message.find(params[:id])
    render 'show.json.jb'
  end

  def create
    if current_user
      @message = Message.new(
        text: params[:text],
        channel_id: params[:channel_id],
        conversation_id: params[:conversation_id],
        user_id: current_user.id
      )

      ActionCable.server.broadcast "messages_channel", {
        id: message.id,
        text: message.text,
        user_id: message.user_id,
        channel_id: message.channel_id,
        conversation_id: message.conversation_id,
        creator: message.user.username,
        created_at: message.created_at
      }
      

      if @message.save
        render 'show.json.jb'
      else
        render json: {error: @message.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: @message.errors.full_messages}, status: :unauthorized
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if current_user.id == @message.user_id
    @message.destroy
    render json: {message: "message has been deleted"}
    else
      render json: {error: @message.errors.full_messages}, status: :unauthorized
    end
  end
end
