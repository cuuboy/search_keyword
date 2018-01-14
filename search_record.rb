class SearchRecord
    def initialize(search_path)
        @path = search_path
    end

    def report
        "Found at: #{@path.join(' > ')}"
    end
end