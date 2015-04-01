class HomeController < ApplicationController

  def index
    @wall_posts = Poster.all.order(:counter).reverse
    @wall_post = Poster.new
  end

  def create
    @wall_post = Poster.new(wall_post_params)
    @wall_post.counter = 0

    respond_to do |format|
      if @wall_post.save
        format.html { redirect_to "/", notice: "Post was successfully added." }
        format.js {}
        format.json { render json: "/", status: :created, location: @wall_post }
      else
        format.html { render action: "new"}
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @wall_post = Poster.find(params[:id])
    @wall_post.counter += 1
    @wall_post.save

    respond_to do |format|
      format.js {}
      format.json {render json: @wall_post, status: :created, location: @wall_post}
    end
  end

  private

  def wall_post_params
    params.require(:poster).permit(:post)
  end

end
