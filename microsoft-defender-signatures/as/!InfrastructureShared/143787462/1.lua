local L0_1, L1_1, L2_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.matched
  end
end
L1_1 = hstrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = hstrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = hstrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.matched
  end
end
if L0_1 and L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.HSTR_WEIGHT
if 1 <= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.LOWFI
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
