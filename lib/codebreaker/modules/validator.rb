module Codebreaker
  module Validator
    NAME_MIN_LENGTH = 3
    NAME_MAX_LENGTH = 20

    def valid?
      validate!
      errors.empty?
    end

    def validate_difficulty
      errors << DifficultyError unless Difficulty::DIFFICULTIES.include? level
    end

    def validate_name_class
      errors << NameIsNotStringError unless name.is_a? String
    end

    def validate_name_min_length
      errors << ShortNameError if name.length < NAME_MIN_LENGTH
    end

    def validate_name_max_length
      errors << LongNameError if name.length > NAME_MAX_LENGTH
    end
  end
end
