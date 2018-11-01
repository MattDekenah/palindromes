require 'spec_helper'

describe Palindromes do
	before :each do
	    @palindromes = Palindromes.new File.dirname(__FILE__) + "/test_file.csv"
	end

	describe "#new" do
    it "takes a string path and returns a Palindromes object" do
      expect(@palindromes).to be_an_instance_of Palindromes
    end
	end

	describe "#is_palindrome" do
    it "takes a palindrome with an odd number of characters and returns true" do
     	expect(@palindromes.is_palindrome("Madam")).to be true
    end

    it "takes a palindrome with an even number of characters and returns true" do
      expect(@palindromes.is_palindrome("Redder")).to be true
    end

    it "takes a non-palindrome and returns false" do
     expect(@palindromes.is_palindrome("Redden")).to be false
    end
  end

  describe "#process_file" do
  	it "processes a csv of words and outputs an array of valid palindromes from those words" do
  		expect(@palindromes.process_file).to contain_exactly("REDDER", "civic", "Madam", "radar", "REFER")
  	end
  end
end