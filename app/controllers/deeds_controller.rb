class DeedsController < ApplicationController
  def index
    @deeds = Deed.all
    if current_user
      if current_user.account
        render :index
      else
        redirect_to new_account_path
      end
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    current_user
    @deed = Deed.find(params[:id])
    @hash = Gmaps4rails.build_markers(@deed) do |deed, marker, infowindow|
      marker.lat deed.latitude
      marker.lng deed.longitude
      marker.infowindow deed.location
    end
  end

  def new
    @deed = Deed.new
  end

  def create
    current_user
    @deed = Deed.new(deed_params)
    @deed.account_id = current_user.account.id
    if @deed.save
      flash[:notice] = "Deed has been added"
      redirect_to deeds_path
    else
      render :new
    end
  end

  def edit
    @deed = Deed.find(params[:id])
  end

  def update
    @deed = Deed.find(params[:id])
    if @deed.update(deed_params)
      flash[:notice] = "Deed has been updated"
      redirect_to deeds_path
    else
      render :edit
    end
  end

  def destroy
    @deed = Deed.find(params[:id])
    @deed.destroy
    flash[:notice] = "Deed has been removed"
    redirect_to deeds_path
  end

private
  def deed_params
    params.require(:deed).permit(:content, :location, :account_id, :latitude, :longitude)
  end
end
