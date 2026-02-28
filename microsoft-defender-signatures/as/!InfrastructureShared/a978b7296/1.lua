local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 2 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.VA
    L1_1 = hstrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.VA
    L2_1 = pe
    L2_1 = L2_1.contains_va
    L3_1 = 1
    L4_1 = L0_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= true then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = pe
    L2_1 = L2_1.contains_va
    L3_1 = 1
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= true then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
