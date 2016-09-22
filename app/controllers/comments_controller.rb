class CommentsController < ApplicationController
  def new
    @deed = Deed.find(params[:deed_id])
    @comment = @deed.comments.new
  end

  def create
    current_user
    @deed = Deed.find(params[:deed_id])
    @comment = @deed.comments.new(comment_params)
    @comment.account_id = current_user.account.id
    if @comment.save
      flash[:notice] = "Comment has been added"
      respond_to do |format|
        format.html { redirect_to deed_path(@comment.deed) }
        format.json
      end
      #
    else
      render :new
    end
  end

  def edit
    @deed = Deed.find(params[:deed_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @deed = Deed.find(params[:deed_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated"
      redirect_to deed_path(@comment.deed)
    else
      render :edit
    end
  end

  def destroy
    @deed = Deed.find(params[:deed_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to deed_path(@deed) }
      format.json
    end
    flash[:notice] = "Comment has been deleted"
  end

  private
  def comment_params
    params.require(:comment).permit(:account_id, :content, :deed_id)
  end
end
