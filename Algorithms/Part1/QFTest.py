import quick_find_eager as eager 
import quick_find_lazy as lazy
import quick_find_improve as improve
import quick_find_compress as compress
import time as time
import random 

startSize = 10000000
multiplier = 2

def execTest(obj, n):
	start = time.time()
	obj.data = range(n)
	testSet = range(n)
	random.shuffle(testSet)

	while  len(testSet) > 0:
		p = testSet.pop()
		q = testSet.pop()
		obj.union(obj.data[q], obj.data[q])

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

#eagerObj = eager.QuickFind(startSize)
#test(eagerObj, 5)

print "\nLazy"

lazyObj = lazy.QuickFind(startSize)
test(lazyObj, 1)

print "\nImprove"

improveObj = improve.QuickFind(startSize)
test(improveObj, 1)

print "\nCompress"

compressObj = compress.QuickFind(startSize)
test(compressObj, 1)



