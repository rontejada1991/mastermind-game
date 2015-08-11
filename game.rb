# Not in the right position feature is not working properly
# Hard coded the solution pwgp, inputting pwpg results in 
# 2 in the right position (working )

class Solution
  ROW_SIZE = 4
  attr_reader :answer

  def initialize(colors)
    @colors = colors
    @answer = populate_answer
  end

  def colors_available
    return @colors
  end

  def populate_answer
    new_answer = Array.new(ROW_SIZE)

    new_answer.each_index do |position|
      color_value = rand(@colors.length)
      color ||= "r"

      case color_value
      when 0 then color = @colors[:red]
      when 1 then color = @colors[:green]
      when 2 then color = @colors[:blue]
      when 3 then color = @colors[:yellow]
      when 4 then color = @colors[:purple]
      when 5 then color = @colors[:white]
      end

      new_answer[position] = color
    end

    return new_answer
  end

  def check_answer(player_answer, correct_answer)
    correct_color = 0
    correct_position = 0
    correct_answer_copies = Hash.new(0)

    correct_answer.each_index do |i|
      correct_answer_copies[correct_answer[i]] += 1
    end

    player_answer.each_index do |i|
      if player_answer[i] == correct_answer[i]
        correct_position += 1
        correct_answer_copies[correct_answer[i]] -= 1
      elsif correct_answer_copies.include?(player_answer[i])
          if correct_answer_copies[player_answer[i]] > 0
            correct_color += 1
            correct_answer_copies[player_answer[i]] -= 1
          end
      end
    end

    if correct_position == 4
      return true
    else
      puts "Correct color and position: #{correct_position}"
      puts "Correct color only: #{correct_color}"
      return false
    end
  end
end

class Player
  attr_accessor :guesses, :answer

  def initialize
    @guesses = 12
  end

  def guess
    print "Enter your next guess: "
    @answer = format_guess(gets.chomp)
    @guesses -= 1
    return @answer
  end

  def format_guess(guess)
    return guess.split("")
  end

  def display_answer
    puts ""
  end
end

class Game
  def initialize
    @solution = Solution.new({ red: "r", green: "g", blue: "b", yellow: "y", purple: "p", white: "w" })
    @player = Player.new
    @won = false
  end

  def introduction
    puts "Mastermind"
    puts "-----"
    puts "Instructions: You have #{@player.guesses} attempts to guess the correct pattern. The computer will choose #{Solution::ROW_SIZE} colors (duplicates are allowed), your job is to find out what they are AND in what order the computer chose them.\nExample: Entering \"rrbw\" means your guessing if the pattern is red, red, blue, white. If you are correct, you WIN. If not, the computer will let you know when you are on the right track."
    puts "Available colors: #{@solution.colors_available}"
    puts "Good Luck!"
    puts "-----"
  end

  def game_loop
    while @player.guesses > 0
      won = @solution.check_answer(@player.guess, @solution.answer)
      if won
        break
      else
        puts "#{@player.guesses} guesses left."
      end
    end

      puts "Correct Answer: #{@solution.answer}"
    if won
      puts "You WIN!"
    else
      puts "You ran out of guesses. Better luck next time."
    end
  end
end

new_game = Game.new
new_game.introduction
new_game.game_loop