module Lexicon
  WORDS = {
    'direction': %w[north south east west],
    'verb': %w[go kill eat]
  }.freeze

  def self.tuple_for(word)
    tuple = nil

    WORDS.each do |token, token_list|
      token_list.each do |token_list_word|
        tuple = [token.to_s, word] if word == token_list_word
      end
      break unless tuple.nil?
    end

    tuple || ['misc', word]
  end

  def self.scan(words)
    tuples = []

    words.split.each do |word|
      tuples.push tuple_for word
    end

    tuples
  end
end
