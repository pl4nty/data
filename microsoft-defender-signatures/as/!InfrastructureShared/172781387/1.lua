local L0_1, L1_1, L2_1, L3_1
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
L1_1 = hstrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if not (L1_1 < 900000) or not (2 <= L0_1) then
  L1_1 = hstrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.VA
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1 = L2_1()
  L2_1 = L2_1 - 22
  L3_1 = pehdr
  L3_1 = L3_1.ImageBase
  L2_1 = L2_1 + L3_1
  if L1_1 ~= L2_1 then
    goto lbl_54
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_54::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
