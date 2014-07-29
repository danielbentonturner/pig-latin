require "./lib/pig_latin.rb"

describe 'Test Pig Lantin gem' do
  it "does not allow a whitespace" do
    result = PigLatin.pigize_it("this is not correct")
    expect(result).to eq(:error)
  end

  it "does not allow a special character" do
    result = PigLatin.pigize_it("this!")
    expect(result).to eq(:error)
  end

  it "does not allow any numbers" do
    result = PigLatin.pigize_it("c0rrect")
    expect(result).to eq(:error)
  end

  it "treats 'y' as a consonant at the beginning of a word" do
    result = PigLatin.pigize_it("yuck")
    expect(result).to eq("uckyay")
  end

  it "treats 'y' as a vowel when not at the beginning of the word" do
    result = PigLatin.pigize_it("rhythm")
    expect(result).to eq("ythmrhay")
  end

  it "adds -'way' to the end of a word that starts with one or more vowels" do
    result = PigLatin.pigize_it("eaten")
    expect(result).to eq("eatenway")
  end

  it "treats 'qu' as a consonant" do
    result = PigLatin.pigize_it("question")
    expect(result).to eq("estionquay")
  end

  it "moves consosntants to the end of the word and adds -'ay'" do
    result = PigLatin.pigize_it("street")
    expect(result).to eq("eetstray")
  end
end

