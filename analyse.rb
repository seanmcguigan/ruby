=begin
text=''
line_count = 0
File.open("oliver.txt").each do |line
|	line_count += 1
	text << line
end
=end

# same as above but simpler
stopwords = %w{the a by on for of are with just but and to the my I has some in}

lines = File.readlines(ARGV[0]) # to array
line_count = lines.size # size of the array
text = lines.join # string of the text

# Count the characters
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length
# characters_nospaces = text.gsub(/\s+/, '')

# all_dots = text.scan(/\.+/).length
# all_commas = text.scan(/,/).length
# all_whole_words = text.scan(/\w+/).length # Any word character (letter, number, underscore)
# all_whole_words_with_hypens = text.scan(/\w-\w/).length
# all_words = all_whole_words + all_whole_words_with_hypens
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.select { |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Summarize the text by cherry picking some choice sentences
# The gsub gets rid of all large areas of whitespace and replaces them with
# a single space (\s+ meaning “one or more whitespace characters”)
# The strip removes all extra whitespace from the start and end of the string
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)

# Sort the length of sentences, from shortest sentence to longest.
# After this line, sentences_sorted contains an array with the sentences in length order.
sentences_sorted = sentences.sort_by { |sentence| sentence.length }

# Divide the number of sentences found by 1/3, the legnth of the array is 6 so 1/3 = 2 
one_third = sentences_sorted.length / 3

# slice(start, length) -- for below sentences_sorted(2, 3) 
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)

# The penultimate line checks to see if the sentence includes the word is or are, and only
# accepts each sentence if so: -- this renders only 2 sentences(1/3) correcting the slice above.
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"