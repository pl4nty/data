local L0_1, L1_1
L0_1 = headerpage
L0_1 = L0_1[1]
if L0_1 == 123 then
  L0_1 = headerpage
  L0_1 = L0_1[2]
  if L0_1 == 92 then
    L0_1 = headerpage
    L0_1 = L0_1[3]
    if L0_1 == 114 then
      L0_1 = headerpage
      L0_1 = L0_1[4]
      if L0_1 == 116 then
        goto lbl_20
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_20::
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
