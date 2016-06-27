class WelcomeController < ApplicationController
  def izzy_bam
  end

  def songs_from_xml(file)
    doc = File.open(file) { |f| Nokogiri::XML(f) }

    name = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::string[1]').text
    artist = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::string[2]').text
    bit_rate = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::integer[8]').text
    sample_rate = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::integer[9]').text
    normalization = doc.xpath('//dict/dict/dict[1]/key[2]/following-sibling::integer[13]').text
  end

  def create_playlist
    @name = name
    @genre = genre
  end

  def vj

  end

end
