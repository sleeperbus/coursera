class QuickFind:
	def __init__(self, n):
		self.data = range(n)
		self.sz = n * [1]

	def myRoot(self, i):
		while i != self.data[i]:
			i = self.data[i]
		return i

	def connected(self, p, q):
		return self.data[p] == self.data[q]

	def union(self, p, q):
		i = self.myRoot(p)
		j = self.myRoot(q)
#		print "i is %d, j is %d" % (i, j)
		if (i == j):
			return
		if (self.sz[i] < self.sz[j]):
			self.data[i] = j
			self.sz[j] = self.sz[j] + self.sz[i]
		else:
			self.data[j] = i
			self.sz[i] = self.sz[i] + self.sz[j]
		print self.data	
		print self.sz
