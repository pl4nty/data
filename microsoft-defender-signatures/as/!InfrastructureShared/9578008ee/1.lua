local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not (40960 < L0_1) then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if not (4 < L0_1) then
    goto lbl_13
  end
end
L0_1 = mp
L0_1 = L0_1.LOWFI
do return L0_1 end
::lbl_13::
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
