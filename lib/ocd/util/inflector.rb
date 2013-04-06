module OCD
  module Util

    class Inflector

      # Will change snake_case to UpperCamelCase or lowerCamelCase
      #
      # ==== Attributes
      #
      # * +string+ String you wish to convert.
      # * +first_letter+ If you wish the first letter to be capitalized.
      #
      # ==== Examples
      #
      #     Inflector.camelize('foo_bar') # FooBar
      #     Inflector.camelize('foo_baz', false) # fooBaz
      def self.camelize(string, first_letter = true)
        regex = first_letter ? /(?:(?:\A|_)(?<letter>[a-z]))+/ : /(?:_(?<letter>[a-z]))+/
        string.gsub(regex) { |letter| letter.upcase }.sub!('_', '')
      end

    end

  end
end
