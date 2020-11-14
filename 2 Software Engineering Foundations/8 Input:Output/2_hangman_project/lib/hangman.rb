class Hangman
  DICTIONARY = %w[cat dog bootcamp pizza apple ruby rails]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    matching_indices = []

    @secret_word.split('').each_with_index do |letter, idx|
      matching_indices << idx if letter == char
    end

    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |index| @guess_word[index] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      print 'that has already been attempted'
      return false
    end

    @attempted_chars << char

    matches = get_matching_indices(char)
    fill_indices(char, matches)
    @remaining_incorrect_guesses -= 1 if matches.empty?

    true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join('') == @secret_word
      print 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      print @secret_word
      true
    else
      false
    end
  end
end

hangman = Hangman.new
p hangman
