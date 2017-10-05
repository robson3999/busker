class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @book = Book.find_by_id(session[:book_id])
    if @book != nil
      added_songs = @book.songs
    	all_songs = Song.all
    	@not_added_songs = all_songs - added_songs
    end
    if params[:term]
      @songs = Song.search(params[:term])
    else
      @songs = Song.all
    end
    if params[:add_song_to_book].present? && session[:book_id].present?
        @book.songs << Song.find(params[:add_song_to_book])
        redirect_to "/songs"
    end
  end


  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])
    @author = @song.author
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # Update params[:author] before creating/updating song
  def song_params_updated
    song_params_updated = {}
    if Author.exists?(:name => song_params[:author])
      song_params_updated[:author] = Author.find_by_name(song_params[:author])
    else
      Author.create(:name => song_params[:author])
      song_params_updated[:author] = Author.last
    end
    song_params.merge(song_params_updated)
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params_updated)
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params_updated)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :text, :author, :term)
    end
end
