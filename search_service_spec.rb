require './search_service.rb'

describe SearchService do
    it 'returns empty search record if key_word not found' do
        service = described_class.new('fixtures/projects.json')

        records = service.find!('not_found_test')
        expect(records.size > 0).to eq(false)
    end

    it 'returns search records if key_word can be found' do
        service = described_class.new('fixtures/projects.json')

        records = service.find!('example')
        expect(records.size).to eq(5)
        expect(records.first.report).
            to eq('Found at: The 1 Element > At attribute url > http://example.com/projects-1')
    end

    it 'raises FileNotExistError when file not found the the given path' do
        expect{
            described_class.new('fixtures/not_existing_file.json')
        }.to raise_error(FileNotExistError)
    end
end