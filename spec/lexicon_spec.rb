require './lexicon'

describe 'Lexicon' do
  it 'handles directions' do
    expect(Lexicon.scan('north')).to eq [%w[direction north]]
    expect(Lexicon.scan('north south east')).to eq [%w[direction north], %w[direction south], %w[direction east]]
  end

  it 'handles verbs' do
    expect(Lexicon.scan('go')).to eq [%w[verb go]]
    expect(Lexicon.scan('go kill eat')).to eq [%w[verb go], %w[verb kill], %w[verb eat]]
  end

  it 'handles stops' do
    expect(Lexicon.scan('the')).to eq [%w[stop the]]
    expect(Lexicon.scan('the in of')).to eq [%w[stop the], %w[stop in], %w[stop of]]
  end

  it 'handles nouns' do
    expect(Lexicon.scan('bear')).to eq [%w[noun bear]]
    expect(Lexicon.scan('bear princess')).to eq [%w[noun bear], %w[noun princess]]
  end

  it 'handles numbers' do
    expect(Lexicon.scan('1234')).to eq [['number', 1234]]
    expect(Lexicon.scan('33 22')).to eq [['number', 33], ['number', 22]]
  end

  it 'handles misc' do
    expect(Lexicon.scan('hola')).to eq [%w[misc hola]]
  end
end
