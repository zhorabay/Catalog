require_relative '../classes/book'

RSpec.describe Book do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:publisher) { 'Penguin' }
  let(:cover_state) { 'good' }

  subject(:book) { described_class.new(publish_date, publisher, cover_state) }

  describe '#initialize' do
    it 'creates a Book instance with the correct attributes' do
      expect(book.publish_date).to eq publish_date
      expect(book.publisher).to eq publisher
      expect(book.cover_state).to eq cover_state
      expect(book.archived).to be false
    end
  end

  describe '#can_be_archived' do
    context 'when cover state is good and more than 10 years old' do
      it 'archives the book' do
        allow(book).to receive(:can_be_archived?).and_return(true)
        book.move_to_archive
        expect(book.archived).to be true
      end
    end

    context 'when cover state is good but less than 10 years old' do
      it 'does not archive the book' do
        allow(book).to receive(:can_be_archived?).and_return(false)
        book.move_to_archive
        expect(book.archived).to be false
      end
    end
  end
end
