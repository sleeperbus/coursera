class QuickFind:
	def __init__(self, n):
		self.data = range(n)
		self.sz = range(n)

	def myRoot(self, i):
		x = i
		while x != self.data[x]:
			self.data[x] = self.data[self.data[x]]
			print "====== grandparent: %d" % (self.data[x])
			x = self.data[x]
		return x

	def connected(self, p, q):
		return self.data[p] == self.data[q]

	def union(self, p, q):
		print "Union: %d, %d" % (p, q)
		print "==== p"
		i = self.myRoot(p)
		print "==== q"
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
