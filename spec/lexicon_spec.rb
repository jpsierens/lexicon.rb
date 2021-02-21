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
end
