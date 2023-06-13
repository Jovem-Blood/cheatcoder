class CodesController < ApplicationController
  before_action :set_code, only: %i[show edit update destroy]
  http_basic_authenticate_with name: 'admin', password: 'beleriand.justdied', except: %i[index show]

  def index
    @codes = Code.all
  end

  def show; end

  def new
    @code = Code.new
  end

  def edit; end

  def create
    @code = Code.new(code_params)

    if @code.save
      redirect_to code_url(@code), notice: 'Code was successfully created.'
    else
       render :new, status: :unprocessable_entity
    end
  end

  def update
    if @code.update(code_params)
      redirect_to code_url(@code), notice: 'Code was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @code.destroy

    redirect_to codes_url, notice: 'Code was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_code
    @code = Code.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def code_params
    params.require(:code).permit(:description, :code_text, :week_id)
  end
end
