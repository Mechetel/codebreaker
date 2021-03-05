require_relative 'codebreaker/version'

require 'yaml'

require_relative 'codebreaker/errors/name_is_not_string_error'
require_relative 'codebreaker/errors/short_name_error'
require_relative 'codebreaker/errors/long_name_error'
require_relative 'codebreaker/errors/difficulty_error'
require_relative 'codebreaker/errors/digit_range_error'
require_relative 'codebreaker/errors/digits_count_error'
require_relative 'codebreaker/errors/expected_difficulty_instance_error'
require_relative 'codebreaker/errors/expected_user_instance_error'

require_relative 'codebreaker/modules/validator'

require_relative 'codebreaker/services/statistics_service'

require_relative 'codebreaker/entities/difficulty'
require_relative 'codebreaker/entities/game'
require_relative 'codebreaker/entities/guess_checker'
require_relative 'codebreaker/entities/user'
