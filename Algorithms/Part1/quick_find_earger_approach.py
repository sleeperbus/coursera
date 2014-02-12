import time

class QuickFindUFEager:
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

