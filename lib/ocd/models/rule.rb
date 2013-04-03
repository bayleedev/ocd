module OCD

  module Models

    # Only one Rule exists
    class Rule

      def all(options)
        # determines which rules to use, and applys their configuration to them
        # Whitelist ONLY with config
        # {FooRule: {soft: 100, hard: 120}}
        # return [FooRule.new(foorule_config), ...]
      end

    end

  end

end