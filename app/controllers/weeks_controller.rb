class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]
  http_basic_authenticate_with name: 'admin', password: 'beleriand.justdied', except: %i[index show]

  # GET /weeks or /weeks.json
  def index
    @weeks = Week.all.order(created_at: :desc)
    @mates = [
      { name: 'Alex', colors: 'white' },
      { name: 'Bruna', colors: 'black' },
      { name: 'Camilla', colors: %w[limegreen dodgerblue] },
      { name: 'Daniel', colors: 'green' },
      { name: 'Guilherme', colors: 'red' },
      { name: 'João', colors: 'orange' },
      { name: 'Natã', colors: 'rebeccapurple' },
      { name: 'Victor', colors: 'yellow' }
    ]
  end

  # GET /weeks/1 or /weeks/1.json
  def show; end

  # GET /weeks/new
  def new
    @week = Week.new
  end

  # GET /weeks/1/edit
  def edit; end

  # POST /weeks or /weeks.json
  def create
    @week = Week.new(week_params)

    respond_to do |format|
      if @week.save
        format.html { redirect_to week_url(@week), notice: 'Week was successfully created.' }
        format.json { render :show, status: :created, location: @week }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeks/1 or /weeks/1.json
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.html { redirect_to week_url(@week), notice: 'Week was successfully updated.' }
        format.json { render :show, status: :ok, location: @week }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1 or /weeks/1.json
  def destroy
    @week.destroy

    respond_to do |format|
      format.html { redirect_to weeks_url, notice: 'Week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_week
    @week = Week.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def week_params
    params.require(:week).permit(:title)
  end
end
