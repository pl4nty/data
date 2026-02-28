local L0_1, L1_1, L2_1
L0_1 = 0
L1_1 = hstrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
if L0_1 == 3 then
  L1_1 = hstrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.VA
  L2_1 = hstrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.VA
  if L1_1 > L2_1 then
    L1_1 = hstrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.VA
    L2_1 = hstrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.VA
    L2_1 = L2_1 + 5
    L2_1 = L2_1 + 44
    if L1_1 == L2_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
