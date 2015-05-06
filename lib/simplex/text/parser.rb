require "simplex/text/parser/version"
require "simplex/text/parser/coefficients_parser"
require "simplex/text/parser/rhs_parser"
require "simplex/text/parser/matrix_parser"

module Simplex
	module Text
		module Parser
			include CoefficientsParser
			include RhsParser
			include MatrixParser

			def parse(str)
				{
					coefficients: extract_coefficients(str),
					matrix: extract_matrix(str),
					rhs: extract_rhs(str)
				}
			end

		end
	end
end
