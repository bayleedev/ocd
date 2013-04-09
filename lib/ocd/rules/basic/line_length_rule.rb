module OCD
  module Rules
    module Basic

      class LineLengthRule < OCD::Models::Rule

        def config=(options)
          @config = {
            soft_line_limit: 100,
            hard_line_limit: 120,
          }.merge(options)
        end

        def apply(file_model)
          file_model.each_with_index do |line, index|
            length = line.to_s.sub(/\n\z/, '').length
            if length > @config[:hard_line_limit]
              file_model.add_violation(
                line: index + 1,
                rule: self.class.name,
                message: "Line exceeds hard limit of #{@config[:hard_line_limit]}"
              )
            elsif length > @config[:soft_line_limit]
              file_model.add_warning(
                line: index + 1,
                rule: self.class.name,
                message: "Line exceeds soft limit of #{@config[:soft_line_limit]}"
              )
            end
          end
        end

      end

    end
  end
end
