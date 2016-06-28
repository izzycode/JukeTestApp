class ActionsController < ApplicationController

  def search
    search_term = params[:search].strip().gsub(" ","+")
    url = "https://itunes.apple.com/search?term=#{search_term}&entity=musicVideo"

    p search_term
    p params[:artist]

    if !params[:specifier].nil?
      case params[:specifier]
      when "artist"
        url += "&attribute=artistTerm"
      when "song"
        url +=  "&attribute=songTerm"
      when "genre"
        url +=  "&attribute=genreIndex"
      end
    end
    p url
    itunes_search = HTTParty.get url
    @parsed_search = JSON.parse(itunes_search.body).with_indifferent_access
    p @parsed_search.first
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
