local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L1_1 = contains
L2_1 = L0_1
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%systemdrive%"
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L3_1(L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ":\\programData\\rclone.exe"
L3_1 = ":\\programData\\usoshared\\"
L4_1 = ":\\perflogs\\"
L5_1 = ":\\windows\\help\\"
L6_1 = ":\\windows\\debug\\"
L7_1 = ":\\windows\\tapi\\"
L8_1 = ":\\windows\\temp\\"
L9_1 = ":\\wmpub\\"
L10_1 = ":\\intel\\"
L11_1 = "\\music\\"
L12_1 = "\\documents\\rclone.exe"
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
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = reportSessionInformationInclusive
  L2_1()
  L2_1 = add_parents
  L2_1()
  L2_1 = reportTimingData
  L2_1()
  L2_1 = pcall
  L3_1 = reportBmInfo
  L2_1, L3_1 = L2_1(L3_1)
  if not L2_1 and L3_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "bmInfoFailReason"
    L6_1 = tostring
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
