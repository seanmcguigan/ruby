text = %q{
Ruby is a great programming language. It is object oriented
and has many groovy features. Some people don't like it, but that's
not our problem! It's easy to learn. It's great. To learn more about Ruby,
visit the official Ruby Web site today.
}

p text

# The gsub gets rid of all large areas of whitespace and replaces them with
# a single space (\s+ meaning “one or more whitespace characters”)
# The strip removes all extra whitespace from the start and end of the string

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/) # Array of sentences
=begin 

The strip removes all extra whitespace from the start and end of the string
Arrays and hashes have the sort_by method, which can rearrange them into almost any
order you want. sort_by takes a code block as its argument, where the code block is an expres-
sion that defines what to sort by. In this case, you’re sorting the sentences array. You pass each
sentence in as the sentence variable, and choose to sort them by their length, using the length
method upon the sentence. After this line, sentences_sorted contains an array with the sen-
tences in length order.

=end

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

puts ideal_sentences.join(". ")
#p ideal_sentences
