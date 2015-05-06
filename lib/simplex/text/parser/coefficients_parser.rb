module Simplex
	module Text
		module Parser
			module CoefficientsParser

				def extract_coefficients(str)
					line = find_line str
					line.scan(/[^\s]?\d/).map(&:to_i)
				end
				
				private
				def find_line(str)
					str.lines.first
				end
			end
		end
	end
end
