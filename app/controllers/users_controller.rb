class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up for Ribbit"
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    @ribbit = Ribbitt.new
  end

  def buddies
    if current_user
      @ribbit = Ribbitt.new
      puts YAML::dump(@ribbit)
      buddies_ids = current_user.followeds.map(&:id).push(current_user.id)


      @ribbits = Ribbitt.find_by(user_id: buddies_ids)
    else
      redirect_to root_url
    end
  end

  def show
    @user= User.find(params[:id])
    @ribbit = Ribbitt.new
    @relationship = Relationship.where(
       follower_id: current_user.id,
       followed_id: @user.id
    ).first_or_initialize if current_user
  end

  private

  def user_params
    params.require(:user).permit(:username,:name,:email, :avatar_url, :password, :password_confirmation, :bio)
  end
end
