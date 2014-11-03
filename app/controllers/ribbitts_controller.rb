class RibbittsController < ApplicationController

  def index
    @ribbits = Ribbitt.all
    @ribbit = Ribbitt.new
  end

  def create
    ribbit = Ribbitt.new(ribbitts_params)
    ribbit.user_id = current_user.id

    flash[:error] = "Your Ribbit was over 140 characters" unless ribbit.save
    redirect_to root_url
  end

  private
  def ribbitts_params
    params.require(:ribbit).permit(:content)
  end
end
