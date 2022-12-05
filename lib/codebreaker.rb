require_relative 'codebreaker/version'

require 'yaml'
require 'pry'
require 'i18n'

I18n.load_path << Dir["#{File.expand_path('locales')}/*.yml"]
I18n.default_locale = :en

require_relative 'codebreaker/errors/validation_error'

require_relative 'codebreaker/modules/validator'

require_relative 'codebreaker/services/statistics_service'

require_relative 'codebreaker/entities/difficulty'
require_relative 'codebreaker/entities/game'
require_relative 'codebreaker/entities/guess_checker'
require_relative 'codebreaker/entities/user'
