local L0_1, L1_1, L2_1, L3_1
L0_1 = hstrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
L1_1 = hstrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = hstrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = hstrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if not L1_1 then
      L1_1 = hstrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
    end
  end
end
L2_1 = hstrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if not L2_1 then
  L2_1 = hstrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.matched
  if not L2_1 then
    L2_1 = hstrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.matched
  end
end
if L0_1 and L1_1 and L2_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
