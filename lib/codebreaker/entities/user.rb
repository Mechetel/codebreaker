module Codebreaker
  class User
    include Validator
    attr_reader :name, :errors

    NAME_MIN_LENGTH = 3
    NAME_MAX_LENGTH = 20

    def initialize(name)
      @name = name
      @errors = []
    end

    private

    def validate!
      validate_name_class
      validate_name_min_length if errors.empty?
      validate_name_max_length if errors.empty?
    end

    def validate_name_class
      @errors << NameIsNotStringError unless @name.is_a? String
    end

    def validate_name_min_length
      @errors << ShortNameError if @name.length < NAME_MIN_LENGTH
    end

    def validate_name_max_length
      @errors << LongNameError if @name.length > NAME_MAX_LENGTH
    end
  end
end
