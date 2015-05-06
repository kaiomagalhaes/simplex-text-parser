module Simplex
	module Text
		module Parser
			module MatrixParser

				def extract_matrix(str)
					lines = find_matrix(str)
					matrix = lines.map{ |line| 
						a = find_values(line).flatten.map(&:to_i)
						p a
						a
					}
					matrix
				end
				
				private
				def find_matrix(str)
					str.lines[1..-2]
				end
				
				def find_values(line)
					puts line
					a = line.scan(/([^\s]?(\d)).*=/)
					p a
					a
				end
			end
		end
	end
end
