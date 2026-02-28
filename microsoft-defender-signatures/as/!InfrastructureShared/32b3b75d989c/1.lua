local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = {}
L2_1 = "\\gsl\\filesync\\rclone.exe"
L3_1 = "schoolsdataarchive\\rclone.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = reportSessionInformation
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
