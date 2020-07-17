class Api::UsersController < ApplicationController
  before_action :authenticate_user, except:[:create]

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render "show.json.jb"
    end
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      user_name: params[:user_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :unauthorized
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user = current_user
      @user.first_name = params[:first_name] || @user.first_name
      @user.last_name = params[:last_name] || @user.last_name
      @user.user_name = params[:user_name] || @user.user_name
      @user.email = params[:email] || @user.email
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
    end

    if @user.save
      render 'show.json.jb'
    else
      render json: { errors: @user.errors.full_messages }, status: :unauthorized
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      render json: {message: "user has been deleted"}
    else
      render json: { errors: @user.errors.full_messages }, status: :unauthorized
    end
  end

end
