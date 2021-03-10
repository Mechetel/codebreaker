module Codebreaker
  class GuessIsNotInteger < StandardError
    def message
      'Guess should be Integer class'
    end
  end
end
