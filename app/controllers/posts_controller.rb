class PostsController < ApplicationController
  # rescue_from ActiveRecord::Record, with: :render_unprocessable_entity

  def show
    post = Post.find(params[:id])
    
    render json: post
  end
  

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  # def render_unprocessable_entity(valid)
  #   render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  # end

end
