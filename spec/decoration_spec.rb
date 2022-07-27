require './person'
require './decorator'

describe CapitalizeDecorator do
  context 'test capitalize class' do
    it 'test for capitalizer to return Mason' do
      person = Person.new(24, 'toyosi')
      capitalize = CapitalizeDecorator.new(person)
      expect(capitalize.correct_name).to eq 'Toyosi'
    end
  end
end

describe TrimmerDecorator do
  context 'test trimmer decorator' do
    it '' do
      person = Person.new(23, 'thegreatkindomofgren', parent_permission: true)
      trimmer = TrimmerDecorator.new(person)
      expect(trimmer.correct_name).to eq 'thegreatki'
    end
  end
end
