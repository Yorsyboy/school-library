require_relative '../book'

describe Book do
  let(:book) { Book.new('The Hobbit', 'J.R.R. Tolkien') }

  describe '#title' do
    it 'returns the title' do
      expect(book.title).to eq('The Hobbit')
    end
  end

  describe '#author' do
    it 'returns the author' do
      expect(book.author).to eq('J.R.R. Tolkien')
    end
  end
end