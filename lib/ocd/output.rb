module OCD

  class Output

    def self.adapter(name)
      OCD::OutputAdapters::Cli.new
    end

    def update(level, item)
      raise OCD::UnimplementedMethod.new('Adapter output has not been implemented.')
    end

  end

end
