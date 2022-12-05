module Codebreaker
  module Validator
    NAME_MIN_LENGTH = 3
    NAME_MAX_LENGTH = 20

    def validate_difficulty(level, errors)
      unless Difficulty::DIFFICULTIES.include? level
        errors << ValidationError.new(I18n.t('difficulty_error'))
      end
    end

    def validate_name_class(name, errors)
      unless name.is_a? String
        errors << ValidationError.new(I18n.t('name_is_not_string_error'))
      end
    end

    def validate_name_min_length(name, errors)
      if name.length < NAME_MIN_LENGTH
        errors << ValidationError.new(I18n.t('short_name_error'))
      end
    end

    def validate_name_max_length(name, errors)
      if name.length > NAME_MAX_LENGTH
        errors << ValidationError.new(I18n.t('long_name_error'))
      end
    end

    def validate_guess_for_not_integer(guess)
      unless guess[/^\d+$/]
        raise ValidationError, I18n.t('guess_is_not_integer')
      end
    end

    def validate_guess_count(guess)
      unless guess.size == Game::DIGITS_NUM
        raise ValidationError, I18n.t('digits_count_error')
      end
    end

    def validate_guess_range(guess)
      unless guess.chars.all? do |num|
             num.to_i.between? Game::MIN_CODE_NUM, Game::MAX_CODE_NUM
           end
        raise ValidationError, I18n.t('digit_range_error')
      end
    end
  end
end
