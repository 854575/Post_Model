class PostController < ApplicationController
  def main
    @post = Post.all
    @user = User.all
    @group = Group.all
    @comment = Comment.all
    @like = Like.all
  end
end
