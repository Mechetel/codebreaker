module Codebreaker
  class StatisticsService
    attr_reader :game, :path

    def initialize(path)
      @path = path
    end

    def store(game)
      statistics = load || []
      statistics << game_to_h(game)
      file = File.open(@path, 'w')
      file.write(statistics.to_yaml)
      file.close
    end

    def sort_statistics
      load.sort_by do |user|
        [user[:attempts_total], user[:attempts_used], user[:hints_used]]
      end
    end

    def load
      make_files(@path)
      YAML.load_file(@path) if File.exist?(@path) && !File.zero?(@path)
    end

    private

    def make_files(file_path)
      Dir.mkdir('db') unless Dir.exist?('db')
      File.new(file_path, 'w') unless File.exist?(file_path)
    end

    def game_to_h(game)
      game_difficulty = game.difficulty

      {
        name: game.user.name,
        difficulty: game_difficulty.level.to_s,
        attempts_total: game_difficulty.attempts,
        attempts_used: game_difficulty.attempts - game.attempts,
        hints_total: game_difficulty.hints,
        hints_used: game_difficulty.hints - game.hints,
        date: game.date
      }
    end
  end
end
