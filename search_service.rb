require './search_data.rb'

FileNotExistError = StandardError.new("File does not exist.")

class SearchService
    def initialize(document_path)
        raise FileNotExistError unless File.exists?(document_path)
        @document_path = document_path
    end
    
    def find!(key_word)
        data = SearchData.new
        exam_seq = 0
        
        file = File.open(@document_path, 'r')

        file.each_char do |c|
            if c == "\n" 
                data.move_line
            else
                data.move_char
            end

            if key_word[exam_seq] == c
                exam_seq += 1
            else
                exam_seq = 0
            end

            if exam_seq >= key_word.size
                data.found!
                break 
            end
        end

        file.close
        
        return data
    end

    private

    attr_reader :document_path
end