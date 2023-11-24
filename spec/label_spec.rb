require_relative '../classes/label'

RSpec.describe Label do
  describe '#initialize' do
    it 'creates a new label with the given attributes' do
      title = 'Gift'
      color = 'red'

      label = Label.new(title, color)

      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
      expect(label.items).to be_empty
    end
  end

  describe '#add_items' do
    it 'adds an item to the label' do
      label = Label.new('Gift', 'red')
      item = Item.new(Date.new(2022, 1, 1))

      label.add_items(item)

      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end
