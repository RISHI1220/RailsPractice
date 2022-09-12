class CommentsController < ApplicationController
    def create
        byebug
        @article = Article.find(params[:id])
        @comment = @article.comments.create(comment_params)
        redirect_to show_post_path(@article.id)
    end
    
    private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
