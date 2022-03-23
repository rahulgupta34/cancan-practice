class CommentsController < ApplicationController
    def create
            @post = Post.find(params[:post_id])
            @comment = @post.comments.build(comment_patams)
            @comment.user_id = current_user.id
            @comment.save
            flash[:comment] = "Comment created successfully."
            redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id]).destroy
        redirect_to posts_path
    end
    private
    def comment_patams
        params.require(:comment).permit(:comment)
    end
end
