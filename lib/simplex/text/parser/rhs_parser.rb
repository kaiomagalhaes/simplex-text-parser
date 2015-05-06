module Simplex
	module Text
		module Parser
			module RhsParser

				def extract_rhs(str)
					lines = find_lines str
					lineNumbers = lines.map{ |linha| linha.scan(/[^\s]?(\d)\s*$/).first }.flatten
					lineNumbers.map(&:to_i)
				end

				def find_lines(str)
					str.lines.slice(1..-2)
				end
			end
		end
	end
end
