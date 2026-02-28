local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_30
  end
end
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.VA
L1_1 = hstrlog
L1_1 = L1_1[2]
L1_1 = L1_1.VA
if L0_1 < L1_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.VA
  L1_1 = hstrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.VA
  if L0_1 < L1_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
::lbl_30::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
