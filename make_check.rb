require 'find'
require 'fileutils'
output_file = File.open("output.txt", "w")
Find.find('.') do |path|
	#print(path)
	if path.include? 'test.txt'
	#if path =~ /.*\_test.txt/
		correct_file = path[0..3]+"correct.txt"
		print(correct_file + "\n")
		print()
		result = FileUtils.compare_file(path, correct_file)
		if result
			print(path + " PASSED\n")
			output_file.write("PASS " + path + "\n")
		else
			print(path + " FAILED\n")
			output_file.write("FAIL " + path + "\n")
		end
	end 
end
output_file.close
