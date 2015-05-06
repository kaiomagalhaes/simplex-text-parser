require "simplex/text/parser/version"
require "simplex/text/parser/coefficients_parser"
require "simplex/text/parser/rhs_parser"

module Simplex
	module Text
		module Parser
			include CoefficientsParser
			include RhsParser

			def parse(str)
				{
					coefficients: extract_coefficients(str),
					matrix:findMatrix,
					rhs:findRhs(str)
				}
			end

			def findMatrix
				[[2,1],[1,2]]
			end

			def findRhs(str)
				extract_rhs(str)
			end

		end
	end
end
