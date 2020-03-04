class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all.page params[:page]
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end
end
