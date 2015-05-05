require 'spec_helper'


describe Simplex::Text::Parser do

	let(:parser) do 
		obj = Object.new
		obj.extend Simplex::Text::Parser
		obj
	end

	let(:two_variable_text_without_signals) do 
		'max 1x + 1y
		 2x    + 1y  <= 4
		 1x     + 2y <= 3
		 1x,    1y    >= 0'
	end

	let(:two_variable_text_with_signals) do 
		'max -1x + 1y
		 -2x    + +1y  <= 4
		 -x     + -2y <= +3
		 1x,    1y    >= 0'
	end

	let(:two_variable_text_without_signals_parsed) do
		parser.parse(two_variable_text_without_signals)
	end

	let(:two_variable_text_with_signals_parsed) do
		parser.parse(two_variable_text_with_signals)
	end

	it 'has a version number' do
		expect(Simplex::Text::Parser::VERSION).not_to be nil
	end

	describe 'parse with two variables' do

		describe 'parse coefficients' do

			it 'parse coefficients without signal' do
				expect(two_variable_text_without_signals_parsed[:coefficients]).to eql([1,1])			
			end

			it 'parse coefficients with signal' do
				expect(two_variable_text_without_signals_parsed[:coefficients]).to eql([-1,1])			
			end

		end

		describe 'parse matrix' do

			it 'parse matrix' do
				expect(two_variable_text_without_signals_parsed[:matrix]).to eql([[2,1],[1,2]])
			end

		end

		describe 'parse rhs' do
			
			it 'parse rhs' do
				expect(two_variable_text_without_signals_parsed[:rhs]).to eql([4,3])
			end

		end
	end

end
