class CommentsController < ApplicationController
    before_action :require_login
    before_action :find_post
    # before_action :find_comment, only: [:destroy]

    def create
        # comment = @post.comments.new(user_id: current_user.id, body: params[:body])
        # comment.save
        # redirect_to post_path(@post)
        @comment = @post.comments.create(user_id: current_user.id, body: params[:body])
        redirect_to post_path(@post)
    end

    # def show
    #     @comment = @post.comments.find_by(id: params[:id])
    #     redirect_to post_path(@post)
    # end
    
    def destroy 
        # @comment.destroy
        # redirect_to post_path(@post)
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private

    def find_post
        @post = Post.find_by(id: params[:post_id])
    end

    # def find_comment
    #     @comment = @post.comments.find(params[:id])
    # end
end
