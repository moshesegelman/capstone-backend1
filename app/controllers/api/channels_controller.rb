class Api::ChannelsController < ApplicationController

  before_action :authenticate_user, except:[:show] 

  def show
    @channel = Channel.find(params[:id])
    render 'show.json.jb'
  end

  def create
    if current_user
      @channel = Channel.new(
        name: params[:name],
        details: params[:details],
        subject_id: params[:subject_id],
        user_id: current_user.id
      )
      if @channel.save
        render 'show.json.jb'
      else
        render json: {error: @channel.errors.full_messages}, status: :unprocessable_entity
      end
    else
      ender json: {error: @channel.errors.full_messages}, status: :unauthorized
    end
  end

  def update  
    @channel = Channel.find(params[:id])
    if current_user.id == @channel.user_id
      @channel.name = params[:name] || @channel.name
      @channel.details = params[:details] || @channel.details
    
      if @channel.save
        render 'show.json.jb'
      else
        render json: {error: @channel.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: @channel.errors.full_messages}, status: :unauthorized  
    end 
  end

  def destroy
    @channel = Channel.find(params[:id])
    if current_user.id == @channel.user_id
      @channel.destroy
      render json: {message: "channel has been deleted"}
    else
      render json: {error: @channel.errors.full_messages}, status: :unauthorized  
    end
  end

end
