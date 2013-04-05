module OCD

  class Options

    # Parse input into hash format.
    #
    # ==== Attributes
    #
    # * +data+ - Array - Array of paths or options. Defaults to `ARGV`.
    #
    # ==== Examples
    #
    #    OCD::Options.new.parse(['--config=foo.yml']) # set config option
    #    OCD::Options.new.parse(['./foo/']) # path
    #    OCD::Options.new.parse(['./foo/', './bar/']) # multiple paths
    def parse(data = ARGV)
      @options = {}
      data.each do |arg|
        option = arg.match(/--(?<key>\w+)(?:=(?<value>.*))?/)
        path = arg.match(/^\.{0,2}\/.*\/$/)
        if option
          @options[option[:key].to_sym] = option[:value] || true
        elsif path
          @options[:path] = [] unless @options[:path]
          @options[:path] << arg
        end
      end
      self
    end

    # Get option by symbol or string
    #
    # ==== Attributes
    #
    #  * +key+ - String|Symbol - Key to lookup by.
    #
    # ==== Examples
    #
    #     options = OCD.Options.new
    #     options.parse(['./foo/', '--config=foo.yml'])
    #     options[:path] # './foo/'
    #     options[:config] # 'foo.yml'
    def [](*keys)
      keys.each do |key|
        key = key.to_sym
        return @options[key] if @options[key]
      end
      nil
    end

  end

end
