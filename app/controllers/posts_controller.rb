class PostsController < ApplicationController
  def create
    the_post = Post.new
    the_post.title = params.fetch("query_title")
    the_post.body = params["query_body"]
    the_post.board_id = params["query_board_id"]
    
    if the_post.valid?
      the_post.save
      redirect_to("/boards/#{the_post.board_id}", { :notice => "Post created successfully." })
    else
      redirect_to("/boards/#{params["query_board_id"]}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.name = params.fetch("query_name")

    if the_post.valid?
      the_post.save
      redirect_to("/boards/#{the_post.board_id}", { :notice => "Post updated successfully."} )
    else
      redirect_to("/boards/#{the_post.board_id}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)
    id = the_post.board_id
    the_post.destroy

    redirect_to("/boards/#{id}", { :notice => "Post deleted successfully."} )
  end
end
