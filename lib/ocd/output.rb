module OCD

  class Output

    def self.adapter(name)
      OCD::OutputAdapters::Cli.new
    end

    # Notify the adapter of various output.
    #
    # ==== Levels
    # `:file` - When `Runner` starts processing a new file. Item will be the file model.
    # `:suite` - When a new suite starts. Item will be the suite name.
    def notify(level, item)
      raise OCD::UnimplementedMethod.new('Adapter output has not been implemented.')
    end

  end

end
