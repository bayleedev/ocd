require 'yaml'

module OCD

  class Runner

    # main entry point
    def self.main(options)
      output = OCD::Output.adapter('cli')
      suites = YAML.load_file(options[:config])
      suites.each do |suite|
        output.notify(:suite, suite[:name] || 'Main')
        rules = OCD::Models::Rule.where(suite[:rules])
        OCD::Models::File.where(suite[:paths]).map do |file_model|
          rules.each do |rule|
            rule.apply(file_model)
          end
          output.notify(:file, file_model)
          file_model = nil
        end
        output.notify(:eos, suite[:name])
      end
    end

  end

end
