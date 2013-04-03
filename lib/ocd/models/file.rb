module OCD

  module Models

    # Each File contains its own model instance
    class File < ::File

      def self.all(options)
        # returns an array of file models -> filtered by options[:glob]
        # Lazy loading? File objects can be expensive since they contain all lines, tokens, etc.
          # So having only one at a time would be better performant.
      end

      def tokens
        # returns array of tokens
      end

      def token(token)
        # returns array of tokens of specific type
      end

      def add_violation(message)
        # add a violation
      end

      def add_warning(message)
        # add a warning
      end

    end

  end

end