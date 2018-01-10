require './search_service.rb'

describe SearchService do
    it 'Searches provided keyword' do
        service = described_class.new('fixtures/projects.json')

        result = service.find!('example')

        expect(result).to eq(true)
    end

end