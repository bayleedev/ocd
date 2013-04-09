require 'ansi/code'
require 'ansi/columns'
require 'pry'

module OCD
  module OutputAdapters

    class Cli < OCD::Output

      def initialize
        @items = []
        super
      end

      def notify(level, item)
        if level == :suite
          suite(item)
        elsif level == :file
          file(item)
        end
      end

      def suite(name)
        puts ANSI::Code.green {
          title = "Suite: #{name}"
          title += "\n" + ("=" * title.length)
        }
      end

      def file(file_model)
        if !file_model.violations?
          puts ANSI::Code.green{ "[OKAY] - #{file_model.path} " }
        else
          puts ANSI::Code.red{ "[FAIL] - #{file_model.path} " }
        end

        if file_model.violations?
          output(file_model.violations, :red)
        end

        if file_model.warnings?
          output(file_model.warnings, :yellow)
        end

      end

      def output(items, color)
        data = [
          ['Line', 'Position', 'Rule', 'Warning'],
          ['====', '========', '====', '=======']
        ]
        items.each do |item|
          data << [item[:line], item[:position], item[:rule], item[:message]]
        end
        puts ANSI::Code.send(color) { ANSI::Table.new(data) }
      end

    end

  end
end
