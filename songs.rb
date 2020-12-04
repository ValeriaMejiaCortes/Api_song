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
    begin
      @artist.gsub!(' ', '%20')
      @title.gsub!(' ', '%20')
      response = RestClient.get "#{api_url}/#{@artist}/#{@title}"
      my_hash = JSON.parse(response)
      if my_hash['lyrics'].empty?
        puts 'No lyrics found'
      else
        puts response
      end
    # rescue Errno::ENETUNREACH
    rescue RestClient::ExceptionWithResponse
      print 'Your URL is bad'
    end
  end
end

=begin
song = Song.new('Coldplay', 'Adventure of a Lifetime')
song.lyrics
=end
