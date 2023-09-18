require_relative '../../classes/game/author'

describe Author do
  let(:author) { Author.new('John', 'Doe') }

  describe '#initialize' do
    it 'sets the first_name attribute' do
      expect(author.first_name).to eq('John')
    end

    it 'sets the last_name attribute' do
      expect(author.last_name).to eq('Doe')
    end

    it 'initializes an empty items array' do
      expect(author.items).to be_empty
    end

    it 'generates a random id between 1 and 1000' do
      expect(author.instance_variable_get(:@id)).to be_between(1, 1000)
    end
  end

  describe '#add_item' do
    it 'sets the author of the added item to self' do
      item = double('Item')
      expect(item).to receive(:author=).with(author)
      author.add_item(item)
    end
  end
end
