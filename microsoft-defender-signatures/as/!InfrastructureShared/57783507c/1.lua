local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.VA
L1_1 = pehdr
L1_1 = L1_1.ImageBase
L1_1 = 0 + L1_1
L1_1 = L1_1 + 3
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
