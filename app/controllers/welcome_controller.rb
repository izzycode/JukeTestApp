class WelcomeController < ApplicationController
  def izzy_bam
    @playlists = Playlist.all
    @icons = ["flash_on","face","favorite","album","play_circle_outline","speaker","headset","whatshot","star"]
  end

  def create_playlist
    params[:playlist][:xml_file].drop(1).each do |file| #not sure why first elem of array result is empty (hence the drop 1)
      playlist = Playlist.create(name: file.original_filename.split(".").first.downcase)
      songs_from_xml(file.tempfile, playlist) #call method from WelcomeHelper
    end
    redirect_to vj_path
  end

  def vj
    @playlist = Playlist.new
    @playlists = Playlist.all
    @songs = Song.all
  end
end
