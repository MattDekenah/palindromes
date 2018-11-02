require 'csv'

class Palindromes
	def initialize(path_to_csv)
		@path_to_csv = path_to_csv
	end

	def process_file
		palindromes = []
		CSV.foreach(@path_to_csv) do |line|
			line&.each do |word|
				palindromes << word&.strip if is_palindrome(word&.strip)
			end
		end
		palindromes
	end

	def is_palindrome(word)
		word&.downcase == word&.downcase&.reverse
	end
end