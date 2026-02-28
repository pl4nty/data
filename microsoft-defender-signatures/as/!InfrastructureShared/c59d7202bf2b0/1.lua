local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L2_1 = #L1_1
  if not (L2_1 < 30) then
    L2_1 = #L1_1
    if not (440 < L2_1) then
      goto lbl_29
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
