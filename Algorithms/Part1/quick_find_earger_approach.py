class QuickFindUF:
	def __init__(self, n):
		self.data = range(n)

	def connected(self, p, q):
		return self.data[p] == self.data[q]

	def union(self, p, q):
		pid = self.data[p]
		qid = self.data[q]

		for idx in range(len(self.data)):
			if self.data[idx] == pid:
				self.data[idx] = qid


testSet = QuickFindUF(100)
testSet.union(1, 50)
testSet.union(3, 2)
testSet.union(50, 23)
print testSet.connected(1, 50)
print testSet.connected(1, 23)
print testSet.connected(3, 10)				