require 'spec_helper'


describe Simplex::Text::Parser do

	let(:parser) do 
		obj = Object.new
		obj.extend Simplex::Text::Parser
		obj
	end

	let(:two_variable_text) do 
		'max x + y
		 2x    + y  <= 4
		 x     + 2y <= 3
		 x,    y    >= 0'
	end

	let(:two_variable_text_parsed) do
		parser.parse(two_variable_text)
	end

	it 'has a version number' do
		expect(Simplex::Text::Parser::VERSION).not_to be nil
	end

	describe 'parse with two variables' do

		it 'parse coefficients' do
			expect(two_variable_text_parsed[:coefficients]).to eql([1,1])			
		end

		it 'parse matrix' do
			expect(two_variable_text_parsed[:matrix]).to eql([[2,1],[1,2]])
		end

		it 'parse rhs' do
			expect(two_variable_text_parsed[:rhs]).to eql([4,3])
		end
		
	end

end
