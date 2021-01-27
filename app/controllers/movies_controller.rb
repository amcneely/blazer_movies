class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    result = Movie::Operation::Create.call(params)
    if result.success?
      puts "IN CONTROLLER - SUCCESS #{result.inspect}"
      @movie = result["model"]
      redirect_to @movie, notice: "Movie was successfully created."
    else
      puts "IN CONTROLLER - FAILURE #{result.inspect}"
      @movie = result["model"]
      render :new
    end

    # @movie = Movie.new(movie_params)
    #
    # respond_to do |format|
    #   if @movie.save
    #     format.html { redirect_to @movie, notice: "Movie was successfully created." }
    #     format.json { render :show, status: :created, location: @movie }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @movie.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :year, :rank)
    end
end
