local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_18
  end
end
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306407
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_18::
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
