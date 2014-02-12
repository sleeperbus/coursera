import quick_find_eager_approach as eager 
import time as time
import random 

startSize = 1000
multiplier = 2

def eagerVersion(n):
	# eager version test
	testEager = eager.QuickFindUFEager(n)
	start = time.time()
	data = range(n-1)
	random.shuffle(data)

	for idx in (range(len(data)-1)):
		testEager.union(data[idx], data[idx+1])
	return time.time() - start	


def testEager(xTimes):
	testCount = xTimes
	dataSize = startSize
	while testCount > 0:
		start = time.time()
		execTimes = eagerVersion(dataSize)
		end = time.time() - start

		print "n: %d, time: %f" % (dataSize, end)
		testCount = testCount - 1

		dataSize = 2 * dataSize


testEager(4)







