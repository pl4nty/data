local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.packed
if not L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if not (8 < L0_1) then
    goto lbl_17
  end
  L0_1 = pesecs
  L0_1 = L0_1[1]
  L0_1 = L0_1.Name
  if L0_1 ~= "" then
    goto lbl_17
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_17::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
