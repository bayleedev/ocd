# Abstract view of how all the classes interact with each other.
module OCD

  module Rules

    # Multiple Rules exist (TrailingWhitespaceRule, IndentionRule, ...)
    class FooRule

      def apply(file_model)
        # usually you'll iterate over the entire file and add violations/warnings
        # You could potentially search file for specific tokens to increase performance
      end

      def enabled
        # Can do specific checks to see if this should be checked
        # Such as pre1.9 shouldn't do NewSyntaxCheck
      end

    end

  end

end