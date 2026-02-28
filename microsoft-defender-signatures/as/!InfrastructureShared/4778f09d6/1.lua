local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.VA
L1_1 = pehdr
L1_1 = L1_1.ImageBase
L1_1 = 0 + L1_1
L1_1 = L1_1 + 4
if L0_1 ~= L1_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.VA
  L1_1 = pehdr
  L1_1 = L1_1.ImageBase
  L1_1 = 0 + L1_1
  L1_1 = L1_1 + 4
  if L0_1 ~= L1_1 then
    goto lbl_22
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_22::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
