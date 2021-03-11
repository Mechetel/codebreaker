module Codebreaker
  class User
    include Validator

    attr_reader :name, :errors

    def initialize(name)
      @name = name
      @errors = []
    end

    private

    def validate!
      validate_name_class
      validate_name_min_length if @errors.empty?
      validate_name_max_length if @errors.empty?
    end
  end
end
