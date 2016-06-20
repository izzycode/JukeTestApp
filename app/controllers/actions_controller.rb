class ActionsController < ApplicationController

  def search
    search_term = params[:search].strip().gsub(" ","+")
    p search_term
    itunes_search = HTTParty.get "https://itunes.apple.com/search?term=#{search_term}&entity=musicVideo"
    @parsed_search = JSON.parse(itunes_search.body).with_indifferent_access

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
