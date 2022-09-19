numbers = list(range(10))
PreviousNum = 0
for i in numbers:
  sum = PreviousNum +i
  print(" Current number " +str(i) + " Previous number " +str(PreviousNum) + " is " +str(sum))
  PreviousNum=i



