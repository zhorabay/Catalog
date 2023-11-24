require_relative '../classes/item'

RSpec.describe Item do
  let(:publish_date) { Date.new(2010, 1, 1).to_s }
  subject(:item) { described_class.new(publish_date) }
  describe '#initialize' do
    it 'creates an Item instance with the correct attributes' do
      expect(item.publish_date).to eq publish_date
      expect(item.archived).to be false
    end
  end
  describe '#move_to_archive' do
    context 'when the item can be archived' do
      it 'archives the item' do
        allow(item).to receive(:can_be_archived?).and_return(true)
        item.move_to_archive
        expect(item.archived).to be true
      end
    end
    context 'when the item cannot be archived' do
      it 'does not archive the item' do
        allow(item).to receive(:can_be_archived?).and_return(false)
        item.move_to_archive
        expect(item.archived).to be false
      end
    end
  end
  describe 'associations' do
    let(:genre) { Genre.new('Sci-Fi') }
    let(:author) { Author.new('John', 'Doe') }
    let(:label) { Label.new('Label Name', 'Label Color') }
    it 'assigns genre to the item' do
      item.genre = genre
      expect(item.genre).to eq genre
      expect(genre.items).to include(item)
    end
    it 'assigns author to the item' do
      item.author = author
      expect(item.author).to eq author
      expect(author.items).to include(item)
    end
    it 'assigns label to the item' do
      item.label = label
      expect(item.label).to eq label
      expect(label.items).to include(item)
    end
  end
  describe 'private method #can_be_archived?' do
    it 'returns true if the item can be archived' do
      allow(Date).to receive(:today).and_return(Date.new(2023, 1, 1).to_s)
      expect(item.send(:can_be_archived?)).to be true
    end
    it 'returns false if the item cannot be archived' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 1, 1).to_s)
      expect(item.send(:can_be_archived?)).to be true
    end
  end
end