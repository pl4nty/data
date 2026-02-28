local L0_1, L1_1, L2_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.VA
  L1_1 = hstrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.VA
  L2_1 = pehdr
  L2_1 = L2_1.ImageBase
  L1_1 = L1_1 + L2_1
  if L0_1 >= L1_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.VA
    L1_1 = hstrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.VA
    L1_1 = L1_1 + 100
    L2_1 = pehdr
    L2_1 = L2_1.ImageBase
    L1_1 = L1_1 + L2_1
    if L0_1 <= L1_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
