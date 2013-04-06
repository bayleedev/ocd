require 'observer'

module OCD

  module Models

    # Each File contains its own model instance
    class File < ::File

      include Observable

      def self.where(paths)
        Dir.glob(paths).map do |file_path|
          new(file_path)
        end
      end

      def initialize(file, mode = 'r', options = {})
        super
        @foo_file = file
        @violations = @warnings = @observers = []
        @default_options = {
          message: 'Unknown error occured.',
          rule: 'Unknown',
          file: path,
          column: 0,
          line: 0,
        }
      end

      def tokens
        # returns array of tokens
      end

      def token(token)
        # returns array of tokens of specific type
      end

      # Add violation
      #
      # ==== Options
      #
      # * +message+ - Required - Message describing the violation.
      # * +rule+ - Required - Line number violation starts on.
      # * +line+ - Optional - Line number violation starts on.
      # * +column+ - Optioanl - Column of the violation.
      #
      # ==== Examples
      #     file.add_violation(rule: self.class.name, line: 10, message: 'Line exceeds ')
      def add_violation(options)
        changed
        @violations << options = @default_options.merge(options)
        notify_observers(:violation, options)
      end

      # Add warning
      #
      # ==== Options
      #
      # * +message+ - Required - Message describing the violation.
      # * +rule+ - Required - Line number violation starts on.
      # * +line+ - Optional - Line number violation starts on.
      # * +column+ - Optioanl - Column of the violation.
      #
      # ==== Examples
      #     file.add_warning(rule: self.class.name, line: 10, message: 'Line exceeds ')
      def add_warning(options)
        changed
        @warnings << options = @default_options.merge(options)
        notify_observers(:warning, options)
      end

    end

  end

end
