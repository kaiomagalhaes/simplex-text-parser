module Simplex
	module Text
		module Parser
			module MatrixParser

				def extract_matrix(str)
					lines = find_matrix(str)
					lines.map{ |line| 
						find_values(line).flatten.map(&:to_i)
					}
				end
				
				private
				def find_matrix(str)
					str.lines[1..-2]
				end
				
				def find_values(line)
					line = line.scan(/.*(?==)/).first
					line.scan(/[^\s\w]?\s*\d/).map{|line| line.gsub(/\s/,'')}
				end
			end
		end
	end
end
