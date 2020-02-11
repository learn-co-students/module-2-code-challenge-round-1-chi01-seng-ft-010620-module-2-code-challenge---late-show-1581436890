class AppearancesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def new
    @appearance.guest.name = flash[:guest_name]
    @appearance.episode.date = flash[:episode_date]
    @appearance = Appearance.new
    @guests = Guest.all
    @episodes = Episode.all
  end

  def create
    @appearance = Appearance.find(params[:id])
    @appearance = Appearance.create(appearance_params)
      if @appearance.save
        redirect_to episode_path(@episode)
      else
        flash[:errors] = @appearance.errors.full_messages
        flash[:guest_name] = @appearance.guest.name
        flash[:episode_date] = @appearance.episode.date
        redirect_to new_appearance_path
  end

  private
  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :guest_name)
  end

end
