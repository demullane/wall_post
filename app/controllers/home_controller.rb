class HomeController < ApplicationController
  #respond_to :html, :js

  def index
    @wall_posts = Poster.all
    @wall_post = Poster.new
  end

  def create
    @wall_post = Poster.new(wall_post_params)

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

  private

  def wall_post_params
    params.require(:poster).permit(:post)
  end

end
