class AccountsController < ApplicationController
  def show
    current_user
    @account = Account.find(params[:id])
  end

  def new
    current_user
    @account = Account.new
  end

  def create
    current_user
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
    current_user
    @account = Account.find(params[:id])
  end

  def update
    current_user
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

private
  def account_params
    params.require(:account).permit(:username)
  end
end
