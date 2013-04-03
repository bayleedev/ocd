module OCD

  class Runner

    # main entry point
    def main
      rules = OCD::Models::Rule.all(options)
      OCD::Models::File.all(options).each do |file_model|
        rules.each do |rule|
          rule.apply(file_model)
        end
      end
    end

  end

end