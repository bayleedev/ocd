module OCD

  class Error < StandardError; end
  class UnimplementedMethod < OCD::Error; end
  class RuleNotImplemented < OCD::Error; end

end
