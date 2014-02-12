class QuickFind:
	def __init__(self, n):
		self.data = range(n)

	def root(i):
		while i != self.data[i]:
			i = id[i]
		return i

	def connected(self, p, q):
		return self.data[p] == self.data[q]

	def union(self, p, q):
		i = self.root(p)
		j = self.root(q)
		self.data[i] = j
