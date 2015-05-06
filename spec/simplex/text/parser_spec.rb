require 'spec_helper'


describe Simplex::Text::Parser do

	let(:parser) do 
		obj = Object.new
		obj.extend Simplex::Text::Parser
		obj
	end

	it 'has a version number' do
		expect(Simplex::Text::Parser::VERSION).not_to be nil
	end

	describe 'parse with two variables' do

		let(:two_variable_text_with_signals) do 
			'max -1x + 1y
			-2x    + +1y  <= +4
			-1x     + -2y <= -3
			-1x,    1y    >= 0'
		end

		let(:two_variable_text_without_signals) do 
			'max 1x + 1y
			2x    + 1y  <= 4
			1x     + 2y <= 3
			1x,    1y    >= 0'
		end


		let(:two_variable_text_without_signals_parsed) do
			parser.parse(two_variable_text_without_signals)
		end

		let(:two_variable_text_with_signals_parsed) do
			parser.parse(two_variable_text_with_signals)
		end

		describe 'parse coefficients' do

			it 'parse coefficients without signals' do
				expect(two_variable_text_without_signals_parsed[:coefficients]).to eql([1,1])			
			end

			it 'parse coefficients with signals' do
				expect(two_variable_text_with_signals_parsed[:coefficients]).to eql([-1,1])			
			end

		end

		describe 'parse matrix' do

			it 'parse matrix without signals' do
				expect(two_variable_text_without_signals_parsed[:matrix]).to eql([[2,1],[1,2]])
			end

			it 'parse matrix with signals' do
				expect(two_variable_text_with_signals_parsed[:matrix]).to eql([[-2,1],[-1,-2]])
			end

		end

		describe 'parse rhs' do
			
			it 'parse rhs without signals' do
				expect(two_variable_text_without_signals_parsed[:rhs]).to eql([4,3])
			end

			it 'parse rhs with signals' do
				expect(two_variable_text_with_signals_parsed[:rhs]).to eql([4,-3])
			end

		end
	end

	describe 'parse with more than two variables' do


		it 'parse with tree variables' do

			text = 'min -1x - 2y + 3z 
			-2x  + 1y + -2z <= + 4
			-1x  +2y - 2z <= -3
			-3x     +5y - 4z <= - 3
			-5x,    1y  , 5z  >= 0'

			result_expected = {
				coefficients:[-1,-2,3],
				matrix:[[-2,1,-2],[-1,2,-2],[-3,5,-4]],
				rhs:[4,-3,-3]
			}
			result = parser.parse(text)
			expect(result_expected).to eql(result)

		end

	end

	describe 'parse with variables missing' do


		it 'variables missing in matrix' do

			text = 'min -1x - 2y + 3z 
				-2x  + 1y <= + 4
			-1x - 2z <= -3
			-3x     +5y - 4z <= - 3
			-5x,    1y  , 5z  >= 0'

			result_expected = {
				coefficients:[-1,-2,3],
				matrix:[[-2,1,0],[-1,0,-2],[-3,5,-4]],
				rhs:[4,-3,-3]
			}
			result = parser.parse(text)
			expect(result_expected).to eql(result)

		end

	end

end
