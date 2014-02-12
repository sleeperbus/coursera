import quick_find_eager_approach as eager 
import quick_find_lazy as lazy
import time as time
import random 

startSize = 1000
multiplier = 2

def execTest(obj, n):
	start = time.time()
	obj.data = range(n)
	random.shuffle(obj.data)

	for idx in (range(len(obj.data)-1)):
		obj.union(obj.data[idx], obj.data[idx+1])
	return time.time() - start	

def test(obj, xTimes):
	testCount = xTimes
	dataSize = startSize
	while testCount > 0:
		start = time.time()
		execTimes = execTest(obj, dataSize)
		end = time.time() - start

		print "n: %d, time: %f" % (dataSize, end)
		testCount = testCount - 1

		dataSize = 2 * dataSize

eagerObj = eager.QuickFind(startSize)
test(eagerObj, 5)

#lazyObj = lazy.QuickFind(startSize)






