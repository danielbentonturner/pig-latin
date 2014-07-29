require "pig_latin/version"

module PigLatin
  def self.pigize_it(word)
    word = word.to_s.downcase
    if word.match(/\d/) || word.match(/\W/)
      :error
      # raise "You must enter a single word, with no spaces, special characters, or numbers."
    elsif word.match(/^[y]/)
      "#{word[1..-1]}yay"
    elsif word.match(/^[aeiou]/)
      "#{word}way"
    elsif word.match(/^[qu]{2}/)
      start = word.slice!(/^[qu]{2}/)
      "#{word}#{start}ay"
    else
      start = word.slice!(/^[^aeiouy]{1,}/)
      "#{word}#{start}ay"
    end
  end
end
