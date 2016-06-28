class ActionsController < ApplicationController

  def search

    @search_from_itunes = search_from_itunes
    @is_artist = params[:specifier] == "artist" ? true : false
    @search_from_db = search_from_db

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end

  end

  def playlist
  end

  def social_image
  end
end
