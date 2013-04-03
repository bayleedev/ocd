module OCD

  class Output

    def listener
      # Maybe Observer pattern?
      # listens to all OCD::Models::File for methods calls to addViolations and addWarnings
      # calls output on child class
    end

    def output(level, message)
      raise OCD::Exceptions::UnimplementedMethod.new('Adapter output has not been implemented.')
    end

  end

end