module OCD
  module OutputAdapters

    class Cli < OCD::Output

      def update(level, item)
        message = []
        message << "Level: #{level}"
        message << "File: #{item[:file]}"
        message << "Line: #{item[:line]}"
        message << "Column: #{item[:column]}"
        message << "Rule: #{item[:rule]}"
        message << " -  #{item[:message]}"
        write message.join(' ')
      end

      def write(message)
        puts(message)
      end

    end

  end
end
