class WelcomeController < ApplicationController
  def izzy_bam
  end


  def create_playlist
    params[:playlist][:xml_file].drop(1).each do |file|
      Playlist.create(name: file.original_filename)
      songs_from_xml(file.tempfile)
    end
    redirect_to vj_path
  end

  def vj
    @playlist = Playlist.new
    @playlists = Playlist.all
    @songs = Song.all
  end

  private

  def songs_from_xml(file)
    doc = File.open(file) { |f| Nokogiri::XML(f) }

    name = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::string[1]').text
    artist = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::string[2]').text
    genre = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::string[4]').text
    bit_rate = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::integer[8]').text
    sample_rate = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::integer[9]').text
    normalization = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::integer[13]').text
    Song.create(name:name,artist:artist,genre:genre,bit_rate:bit_rate,sample_rate:sample_rate,normalization:normalization)
  end


end
