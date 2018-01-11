require './search_service.rb'

describe SearchService do
    it 'returns search data with found=false if key_word not found' do
        service = described_class.new('fixtures/projects.json')

        result = service.find!('not_found_test')
        expect(result.found?).to eq(false)
    end

    it 'returns search data with found=true if key_word can be found' do
        service = described_class.new('fixtures/projects.json')

        result = service.find!('example')
        expect(result.found?).to eq(true)
    end

    it 'raises FileNotExistError when file not found the the given path' do
        expect{
            described_class.new('fixtures/not_existing_file.json')
        }.to raise_error(FileNotExistError)
    end
end