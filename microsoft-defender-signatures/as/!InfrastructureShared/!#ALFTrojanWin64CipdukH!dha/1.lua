local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
L1_1 = "mui"
L0_1 = L0_1 .. L1_1
L1_1 = sysio
L1_1 = L1_1.IsFileExists
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.ReportLowfi
  L2_1 = L0_1
  L3_1 = 4215686520
  L1_1(L2_1, L3_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
