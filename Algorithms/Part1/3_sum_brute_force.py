class threeSum:
	def __init__(self, arr):
		self.data = arr
		self.count = 0

	def occurance(self):
		for i in range(len(self.data)):
			for j in range(1, len(self.data)):
				for k in range(2, len(self.data)):
					if self.data[i] + self.data[j] + self.data[k] == 0:
						self.count = self.count + 1
		return self.count


testData = [30, -40, -20, -10, 40, 0, 10, 5]		
testThree = threeSum(testData)
print testThree.occurance()



