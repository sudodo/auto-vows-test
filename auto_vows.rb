
if ARGV.size == 0 or ARGV[0] == "-h"
	print "usage: auto-vow INTERVAL(sec) testfile*\n"
	exit
end

interval = ARGV.shift.to_i

filenames = []
while(ARGV.size != 0)
	filenames.push ARGV.shift
end 

while true
	system("echo \"#{Time.now} run auto-vows-test\" >> auto-vows.log")
	filenames.each { |filename| system("./vows #{filename} >> auto-vows.log") }
	sleep interval
end
