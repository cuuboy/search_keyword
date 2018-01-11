class SearchData 
    attr_reader :line, :position

    def initialize
        @line = 1
        @position = 1
        @found = false
    end

    def report
        {
            line: line,
            position: position,
            found: found
        }
    end

    def move_line
        @line += 1
        @position = 0
    end

    def move_char
        @position += 1
    end

    def found!
        @found = true
    end

    def found?
        @found
    end
end