class DeedsController < ApplicationController
  def index
    @deeds = Deed.all
  end

  def show
    @deed = Deed.find(params[:id])
  end

  def new
    @deed = Deed.new
  end

  def create
    @deed = Deed.new(deed_params)
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
    params.require(:deed).permit(:content, :location)
  end
end
