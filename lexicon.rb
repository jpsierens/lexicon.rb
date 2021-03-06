module Lexicon
  WORDS = {
    'direction': %w[north south east west],
    'verb': %w[go kill eat],
    'stop': %w[the in of],
    'noun': %w[bear princess],
  }.freeze

  def self.tuple_for(word)
    tuple = nil

    begin
      num = Integer(word)
      return ['number', num]
    rescue => exception
    end

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
