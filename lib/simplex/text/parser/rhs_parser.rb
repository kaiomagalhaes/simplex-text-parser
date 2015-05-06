module Simplex
	module Text
		module Parser
			module RhsParser

				def extract_rhs(str)
					lines = find_lines str
					lineNumbers = lines.map{|linha|linha.scan(/([^\s]?\d)\n*$/).first}.flatten
					lineNumbers.map(&:to_i)
				end

				private
				def find_lines(str)
					str.lines[1..-2]
				end
			end
		end
	end
end
