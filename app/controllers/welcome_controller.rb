class WelcomeController < ApplicationController
  def izzy_bam
    @playlists = Playlist.all
    @icons = ["flash_on","face","favorite","album","play_circle_outline","speaker","headset","whatshot","star"]
  end


  def create_playlist
    params[:playlist][:xml_file].drop(1).each do |file| #not sure why first elem of array result is empty (hence the drop 1)
      playlist = Playlist.create(name: file.original_filename.split(".").first.downcase)
      songs_from_xml(file.tempfile, playlist)
    end
    redirect_to vj_path
  end

  def vj
    @playlist = Playlist.new
    @playlists = Playlist.all
    @songs = Song.all
  end

  private

  def songs_from_xml(file, playlist)

    doc = File.open(file) { |f| Nokogiri::XML(f) }

    songs = doc.xpath('//dict/dict/dict').count
    counter = 1
    while counter <= songs
      name = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::string[1]").text.downcase
      artist = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::string[2]").text.downcase
      artist_for_search = artist.strip().gsub(" ","+")
      image = HTTParty.get "http://www.nvivo.es/api/request.php?api_key=#{ENV['NVIVO_API_KEY']}&method=artist.getEvents&artist=#{artist_for_search}&country_iso=US&format=json"
      img = JSON.parse(image.body).with_indifferent_access
      if (img["status"] != "success") || (img["response"]["gigs"].count == 0)
        image_url = "#"
      else
        image_url = img["response"]["gigs"].first["images"]["large"]
      end
      genre = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::string[4]").text.downcase
      bit_rate = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::integer[8]").text
      sample_rate = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::integer[9]").text
      normalization = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::integer[13]").text

      playlist.songs << Song.create(name:name,artist:artist,image_url:image_url,genre:genre,bit_rate:bit_rate,sample_rate:sample_rate,normalization:normalization)
      counter +=1
    end
  end


end
