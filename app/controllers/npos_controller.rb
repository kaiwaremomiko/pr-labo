class NposController < ApplicationController
  before_action :set_npo, only: [:show, :edit, :update, :destroy]

  # GET /npos
  # GET /npos.json
  def index
    @npos = Npo.page(params[:page]).search(params[:search])
  end

  # GET /npos/1
  # GET /npos/1.json
  def show
  end

  # GET /npos/new
  def new
    @npo = Npo.new
  end

  # GET /npos/1/edit
  def edit
  end

  # POST /npos
  # POST /npos.json
  # def create
  #   @npo = Npo.new(npo_params)

  #   respond_to do |format|
  #     if @npo.save
  #       format.html { redirect_to @npo, notice: 'Npo was successfully created.' }
  #       format.json { render :show, status: :created, location: @npo }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @npo.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /npos/1
  # PATCH/PUT /npos/1.json
  # def update
  #   respond_to do |format|
  #     if @npo.update(npo_params)
  #       format.html { redirect_to @npo, notice: 'Npo was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @npo }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @npo.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /npos/1
  # DELETE /npos/1.json
  # def destroy
  #   @npo.destroy
  #   respond_to do |format|
  #     format.html { redirect_to npos_url, notice: 'Npo was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_npo
      @npo = Npo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def npo_params
      params.require(:npo).permit(:corporate_name, :prefecture, :address, :representative, :certification_date, :establish_purpose, :field)
    end
end
