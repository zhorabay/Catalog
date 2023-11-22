require_relative '../classes/author'

RSpec.describe Author do
  describe '#initialize' do
    it 'creates a new label with the given attributes' do
      first_name = 'Jhon'
      last_name = 'doe'

      author = Author.new(first_name, last_name)

      expect(author.first_name).to eq(first_name)
      expect(author.last_name).to eq(last_name)
      expect(author.items).to be_empty
    end
  end

  describe '#add_items' do
    it 'adds an item to the author' do
      author = Author.new('Jhon', 'doe')
      item = Item.new(Date.new(2022, 1, 1))

      author.add_items(item)

      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end
  end
end
