class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end
end
