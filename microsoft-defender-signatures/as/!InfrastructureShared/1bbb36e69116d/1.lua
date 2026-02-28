local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
L1_1 = L0_1
L0_1 = L0_1.lower
L0_1 = L0_1(L1_1)
L1_1 = {}
L2_1 = "rclone.exe"
L3_1 = "megasync.exe"
L4_1 = "freefilesync.exe"
L5_1 = "realtimesync.exe"
L6_1 = "FreeFileSync_Win32.exe"
L7_1 = "FreeFileSync_x64.exe"
L8_1 = "RealTimeSync_Win32.exe"
L9_1 = "RealTimeSync_x64.exe"
L10_1 = "gclone.exe"
L11_1 = "lclone.exe"
L12_1 = "fclone.exe"
L13_1 = "cmmagent"
L14_1 = "pcloud.exe"
L15_1 = "FreeFileSyncPortable.exe"
L16_1 = "upclone"
L17_1 = "\\rclone\\"
L18_1 = "rbclone.exe"
L19_1 = "dellfiletransferutil.exe"
L20_1 = "restic.exe"
L21_1 = "restic_"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L1_1[19] = L20_1
L1_1[20] = L21_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = MpCommon
L4_1 = L4_1.ExpandEnvironmentVariables
L5_1 = "%systemdrive%"
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L4_1(L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "program files"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = "BM"
  L5_1 = "T1567"
  L6_1 = "ToolExfilOverWeb"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = reportRelatedBmHits
  L3_1()
  L3_1 = add_parents
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
