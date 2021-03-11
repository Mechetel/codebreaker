module Codebreaker
  class User
    include Validator

    attr_reader :name, :errors

    def initialize(name)
      @name = name
      @errors = []
    end

    def valid?
      validate_name_class(@name, @errors)
      validate_name_min_length(@name, @errors) if @errors.empty?
      validate_name_max_length(@name, @errors) if @errors.empty?
      @errors.empty?
    end
  end
end
