module ActionsHelper

  def search_from_itunes
    search_term = params[:search].strip.gsub(" ","+")
    url = "https://itunes.apple.com/search?term=#{search_term}&entity=musicVideo"

    if !params[:specifier].nil?
      case params[:specifier]
      when "song"
        url +=  "&attribute=songTerm"
      when "genre"
        url +=  "&attribute=genreIndex"
      else
        url += "&attribute=artistTerm"
      end
    end
    p url
    itunes_search = HTTParty.get url
    JSON.parse(itunes_search.body).with_indifferent_access

  end

  def search_from_db
    params[:specifier] = "name" if params[:specifier] == "song"
    Song.where("#{params[:specifier]}": "#{params[:search].downcase}")
  end
end
