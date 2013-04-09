module OCD

  module Models

    # Only one Rule exists
    class Rule

      attr_reader :config

      # Return array of all the rules
      #
      # ==== Attributes
      #
      # * +rules+ Array of rules. Each rule should contain `:path`, and
      #           optionally `:config` and `:name`.
      #
      # ==== Examples
      #
      #     OCD::Models::Rule.where([{path: 'foo/bar/baz.rb'}])
      def self.where(rules)
        rules.map do |rule|
          rule = OCD::Rules::Basic::LineLengthRule.new.tap do |obj|
            obj.config = rule[:config] || {}
          end
        end
      end

      # Set or merge existing configuration.
      def config=(options)
        @config = options
      end

      # Each enabled rule wil have a file_model passed to it
      def apply(file_model)
        raise OCD::RuleNotImplemented.new('Rule has not been implemented')
      end

      # If this rule should be enabled.
      def enabled
        true
      end

    end

  end

end
