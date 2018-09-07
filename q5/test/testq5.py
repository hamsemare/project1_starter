'''
Checks the output of the solution for Q2
'''

import sys

lines = []
result_file = open(sys.argv[1], 'r')
for line in result_file:
	lines.append(line.strip())

if len(lines) > 1 and lines[0] != 'error':
	print "====> ERROR: the output has more lines than expected"
	exit(1)

if len(lines) == 0:
	print "====> ERROR: there is no output"
	exit(1)

if lines[0] != 'success' and lines[0] != 'error':
	print "====> ERROR: output does not look as specified"
	exit(1)
else:
	print "====> SUCCESS: output is formatted correctly"
