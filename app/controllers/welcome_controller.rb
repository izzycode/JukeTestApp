class WelcomeController < ApplicationController
  def izzy_bam
    p "ROOT!  "*19

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
      genre = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::string[4]").text.downcase
      bit_rate = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::integer[8]").text
      sample_rate = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::integer[9]").text
      normalization = doc.xpath("//dict/dict/dict[#{counter}]/key[2]/following-sibling::integer[13]").text
      playlist.songs << Song.create(name:name,artist:artist,genre:genre,bit_rate:bit_rate,sample_rate:sample_rate,normalization:normalization)
      counter +=1
    end

  end


end
