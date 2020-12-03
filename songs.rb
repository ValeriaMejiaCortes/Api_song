require 'rest-client'
require 'json'

class Song
  attr_accessor :artist, :title, :api_url

  def initialize(artist, title, api_url = 'https://api.lyrics.ovh/v1')
    @api_url = api_url
    @artist = artist
    @title = title
  end

  def lyrics
    @artist.gsub!(' ', '%20')
    @title.gsub!(' ', '%20')
    response = RestClient.get "#{api_url}/#{@artist}/#{@title}"
    my_hash = JSON.parse(response)
    if my_hash['lyrics'].empty?
      puts 'No lyrics found'
    else
      puts response
    end
  end
end

song = Song.new('Coldplay', 'Adventure of a Lifetime')
song.lyrics
