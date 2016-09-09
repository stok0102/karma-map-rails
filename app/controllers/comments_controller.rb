class CommentsController < ApplicationController
  def new
    @deed = Deed.find(params[:deed_id])
    @comment = @deed.comments.new
  end

  def create
    @deed = Deed.find(params[:deed_id])
    @comment = @deed.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been added"
      redirect_to deed_path(@comment.deed)
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
    flash[:notice] = "Comment has been deleted"
    redirect_to deed_path(@deed)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :content, :deed_id)
  end
end
