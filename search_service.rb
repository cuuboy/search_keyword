require './search_record.rb'
require 'json'

FileNotExistError = StandardError.new("File does not exist.")

class SearchService
    def initialize(document_path)
        raise FileNotExistError unless File.exists?(document_path)
        @document_path = document_path
    end

    def document
        @_document ||= JSON.parse(File.read(@document_path))
    end
    
    def find!(key_word)
        return dig_find(document, key_word.to_s)
    end

    private

    attr_reader :document_path

    def dig_find(obj, target, path = [])
        if obj.kind_of?(Array)
            return obj.each_with_index.map do |value, index|
                dig_find(value, target, path + ["The #{index+1} Element"])
            end.flatten.compact
        elsif obj.kind_of?(Hash)
            return obj.map do |key, object|
                dig_find(object, target, path + ["At attribute #{key}"])
            end.flatten.compact
        else
            if obj.to_s.include?(target)
               return SearchRecord.new(path + [obj])
            end
        end
    end
end