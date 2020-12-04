require 'rspec'
require 'pry'
require_relative 'songs'

RSpec.describe Song do
  describe 'the artist and title exist' do
    it 'return the song lyrics' do
      song = Song.new('Coldplay', 'Adventure of a Lifetime')
      expect(song.lyrics).not_to eql('')
    end
  end

  describe 'the artist and title does not exist' do
    it 'return an empty hash value' do
      song = Song.new('Tigresa del oeste', 'Baila')
      expect(song.lyrics).to be_equal(nil)
    end
  end

  describe 'Calling the class' do
    it 'should run without raising an exception' do
      song = Song.new('Coldplay', 'Adventure of a Lifetime', 'https://api.lyrics.ovh/v')
      expect { song.lyrics }.to output('Your URL is bad').to_stdout
    end
  end
end
