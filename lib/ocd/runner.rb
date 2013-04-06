require 'yaml'

module OCD

  class Runner

    # main entry point
    def self.main(options)
      output = OCD::Output.adapter('cli')
      suites = YAML.load_file(options[:config])
      suites.each do |suite|
        rules = OCD::Models::Rule.where(suite[:rules])
        OCD::Models::File.where(suite[:paths]).map do |file_model|
          file_model.add_observer(output)
          rules.each do |rule|
            rule.apply(file_model)
          end
        end
      end
    end

  end

end
