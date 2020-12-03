require 'rspec'
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
end
