class QuickFind:
	def __init__(self, n):
		self.data = range(n)

	def myRoot(self, i):
		while i != self.data[i]:
			i = self.data[i]
		return i

	def connected(self, p, q):
		return self.data[p] == self.data[q]

	def union(self, p, q):
		i = self.myRoot(p)
		j = self.myRoot(q)
		self.data[i] = j
