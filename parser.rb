class ParserError < RuntimeError
end

class Sentence
  def initialize(subject, verb, obj)
    # remember we take ['noun','princess'] pairs and convert them
    @subject = subject[1]
    @verb = verb[1]
    @object = obj[1]
  end

  attr_reader :subject, :verb, :object
end

def peek(word_list)
  return unless word_list

  word = word_list[0]
  word[0]
end

def match(word_list, expecting)
  return unless word_list

  word = word_list.shift
  word if word[0] == expecting
end

def skip(word_list, word_type)
  match(word_list, word_type) while peek(word_list) == word_type
end

def parse_verb(word_list)
  skip(word_list, 'stop')
  raise ParserError, 'Expected a verb next.' unless peek(word_list) == 'verb'

  match(word_list, 'verb')
end

def parse_object(word_list)
  skip(word_list, 'stop')
  next_word = peek(word_list)

  if next_word == 'noun'
    match(word_list, 'noun')
  elsif next_word == 'direction'
    match(word_list, 'direction')
  else
    raise ParserError, 'Expected a noun or direction next.'
  end
end

def parse_subject(word_list)
  skip(word_list, 'stop')
  next_word = peek(word_list)

  if next_word == 'noun'
    match(word_list, 'noun')
  elsif next_word == 'verb'
    %w[noun player]
  else
    raise ParserError, 'Expected a verb next.'
  end
end

def parse_sentence(word_list)
  subj = parse_subject(word_list)
  verb = parse_verb(word_list)
  obj = parse_object(word_list)

  return Sentence.new(subj, verb, obj)
end
