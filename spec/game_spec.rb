require_relative '../classes/game'

RSpec.describe Game do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:multiplayer) { 'no' }
  let(:last_played_at) { Date.new(2020, 1, 1) }

  subject(:game) { described_class.new(publish_date, multiplayer, last_played_at) }

  describe '#initialize' do
    it 'creates a Game instance with the correct attributes' do
      expect(game.publish_date).to eq publish_date
      expect(game.multiplayer).to eq multiplayer
      expect(game.last_played_at).to eq last_played_at
      expect(game.archived).to be false
    end
  end

  describe '#can_be_archived' do
    context 'when  you last enter the game more than 2 years and more than 10 years old' do
      it 'archives the game' do
        allow(game).to receive(:can_be_archived?).and_return(true)
        game.move_to_archive
        expect(game.archived).to be true
      end
    end

    context 'when cover state is good but less than 10 years old' do
      it 'does not archive the game' do
        allow(game).to receive(:can_be_archived?).and_return(false)
        game.move_to_archive
        expect(game.archived).to be false
      end
    end
  end
end
