local L0_1, L1_1, L2_1, L3_1
L0_1 = isTamperProtectionOn
L0_1 = L0_1()
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.get_imagepath
  L0_1 = L0_1()
  if L0_1 then
    L1_1 = mp
    L1_1 = L1_1.ReportLowfi
    L2_1 = L0_1
    L3_1 = 1443100823
    L1_1(L2_1, L3_1)
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
