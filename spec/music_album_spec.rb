require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  let(:on_spotify) { true }
  let(:publish_date) { Date.new(2010, 1, 1) }

  subject(:album) { described_class.new(publish_date, on_spotify) }

  describe '#initialize' do
    it 'creates a MusicAlbum instance with the correct attributes' do
      album = described_class.new(publish_date, on_spotify)
      expect(album.on_spotify).to eq on_spotify
      expect(album.publish_date).to eq publish_date
      expect(album.archived).to be false
    end
  end

  describe '#can_be_archived' do
    context 'if the album is on Spotify' do
      it 'archives the album' do
        allow(album).to receive(:can_be_archived?).and_return(true)
        album.move_to_archive
        expect(album.archived).to be true
      end
    end
  end

  describe 'check if user input is correct' do
    context 'when user enters the publish date' do
      it 'return the correct date' do
        expected_date = Date.new(2020, 1, 1)
        music_album = MusicAlbum.new(expected_date, true)
        expect(music_album.publish_date).to eq(expected_date)
      end

      it 'returns if the album is on Spotify' do
        music_album = MusicAlbum.new(Date.new(2020, 1, 1), true)
        expect(music_album.on_spotify).to eq(true)
      end
    end
  end
end
