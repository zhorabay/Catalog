require_relative '../classes/genre'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new genre with the given attributes' do
      name = 'Rock'

      genre = Genre.new(name)

      expect(genre.name).to eq(name)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Rock')
      item = Item.new(Date.new(2022, 1, 1))

      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
