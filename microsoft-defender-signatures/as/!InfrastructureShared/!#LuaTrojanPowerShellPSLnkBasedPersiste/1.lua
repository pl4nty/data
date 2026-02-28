local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "LnkWithPowerShellCmd"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 and L1_1 == true then
  L2_1 = mp
  L2_1 = L2_1.ReportLowfi
  L3_1 = mp
  L3_1 = L3_1.getfilename
  L3_1 = L3_1()
  L4_1 = 818474255
  L2_1(L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
