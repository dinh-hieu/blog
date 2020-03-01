class Admin::MicropostsController < Admin::ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  def index
    @microposts = Micropost.all
  end

  # GET /admin/microposts/1
  # GET /admin/microposts/1.json
  def show
  end

  # GET /admin/microposts/new
  def new
    @micropost = current_user.microposts.new
  end

  # GET /admin/microposts/1/edit
  def edit
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = current_user.microposts.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to admin_micropost_path(@micropost), notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/microposts/1
  # PATCH/PUT /admin/microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to admin_micropost_path(@micropost), notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/microposts/1
  # DELETE /admin/microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to admin_microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:title, :content, :user_id, :category_id)
    end
end
