require "simplex/text/parser/version"
require "simplex/text/parser/coefficients_parser"

module Simplex
	module Text
		module Parser
			include CoefficientsParser

			def parse(str)
				{
					coefficients: extract_coefficients(str),
					matrix:findMatrix,
					rhs:findRhs
				}
			end

			def findMatrix
				[[2,1],[1,2]]
			end

			def findRhs
				nil
			end

		end
	end
end
