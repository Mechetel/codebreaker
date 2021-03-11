module Codebreaker
  module Validator
    NAME_MIN_LENGTH = 3
    NAME_MAX_LENGTH = 20

    DIFFICULTY_ERROR = 'No such difficulty'.freeze
    NAME_IS_NOT_STRING_ERROR = 'Name should be an instance of String'.freeze
    SHORT_NAME_ERROR = 'Name is too short'.freeze
    LONG_NAME_ERROR = 'Name is too long'.freeze

    def validate_difficulty(level, errors)
      errors << ValidationError.new(DIFFICULTY_ERROR) unless Difficulty::DIFFICULTIES.include? level
    end

    def validate_name_class(name, errors)
      errors << ValidationError.new(NAME_IS_NOT_STRING_ERROR) unless name.is_a? String
    end

    def validate_name_min_length(name, errors)
      errors << ValidationError.new(SHORT_NAME_ERROR) if name.length < NAME_MIN_LENGTH
    end

    def validate_name_max_length(name, errors)
      errors << ValidationError.new(LONG_NAME_ERROR) if name.length > NAME_MAX_LENGTH
    end
  end
end
