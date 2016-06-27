class ActionsController < ApplicationController

  def search
    search_term = params[:search].strip().gsub(" ","+")
    url = "https://itunes.apple.com/search?term=#{search_term}&entity=musicVideo"

    p search_term
    if !params[:search][:artist].nil?
      url += "&attribute=artistTerm"
    end
    if !params[:search][:song].nil?
      url +=  "&attribute=songTerm"
    end
    if !params[:search][:song].nil?
      url +=  "&attribute=genreIndex"
    end

    itunes_search = HTTParty.get url
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
