class ActionsController < ApplicationController

  def search
    # @search_from_itunes = search_from_itunes
    # @is_artist = params[:specifier] == "artist" ? true : false
    # @search_from_db = search_from_db
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def search_autofill
    all_song_names = Song.pluck(:name).uniq.map{|x| x.titleize}
    all_artist_names = Song.pluck(:artist).uniq.map{|x| x.titleize}
    ##### Gotta move this elsewhere->
    @autofill = all_artist_names.each_with_index do |x,i|
                  x << ": #{all_song_names[i]}"
                end
   end

  def playlist
  end

  def social_image
  end
end
