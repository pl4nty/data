local L0_1, L1_1, L2_1, L3_1
L0_1 = "c:\\Windows\\System32\\en-US\\appmgmt.dll.mui"
L1_1 = sysio
L1_1 = L1_1.IsFileExists
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.ReportLowfi
  L2_1 = L0_1
  L3_1 = 504602719
  L1_1(L2_1, L3_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
