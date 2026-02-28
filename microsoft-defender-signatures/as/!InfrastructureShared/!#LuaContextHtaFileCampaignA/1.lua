local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 15) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = string
L1_1 = L1_1.match
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = "^player%d%d%d%d%d.+%.hta$"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 15) then
    goto lbl_33
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_33::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
