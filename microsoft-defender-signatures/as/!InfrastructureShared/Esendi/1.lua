local L0_1, L1_1, L2_1, L3_1
L0_1 = MpCommon
L0_1 = L0_1.ExpandEnvironmentVariables
L1_1 = "%ALLUSERSPROFILE%"
L0_1 = L0_1(L1_1)
L1_1 = sysio
L1_1 = L1_1.StopService
L2_1 = "bits"
L1_1(L2_1)
L1_1 = Info
L1_1 = L1_1.OSMajorVersion
if 6 < L1_1 then
  L1_1 = sysio
  L1_1 = L1_1.DeleteFile
  L2_1 = L0_1
  L3_1 = "\\Microsoft\\Network\\Downloader\\qmgr.db"
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
else
  L1_1 = sysio
  L1_1 = L1_1.DeleteFile
  L2_1 = L0_1
  L3_1 = "\\Microsoft\\Network\\Downloader\\qmgr0.db"
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
  L1_1 = sysio
  L1_1 = L1_1.DeleteFile
  L2_1 = L0_1
  L3_1 = "\\Microsoft\\Network\\Downloader\\qmgr1.db"
  L2_1 = L2_1 .. L3_1
  L1_1(L2_1)
end
