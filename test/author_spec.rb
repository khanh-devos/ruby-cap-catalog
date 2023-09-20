require_relative '../classes/author'

RSpec.describe Author do
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:item) { double('item', id: 1) }

  subject(:author) { described_class.new(first_name, last_name) }

  describe '#initialize' do
    it 'sets the first name, last name, and items attributes' do
      expect(author.first_name).to eq(first_name)
      expect(author.last_name).to eq(last_name)
      expect(author.items).to be_empty
    end
  end

  describe '#add_item' do
    context 'when the item is not already associated with the author' do
      before do
        allow(item).to receive(:author=)
      end

      it 'adds the item to the author\'s items and sets the author attribute of the item' do
        author.add_item(item)
        expect(author.items).to include(item.id)
        expect(item).to have_received(:author=).with("#{first_name} #{last_name}")
      end
    end
  end
end
