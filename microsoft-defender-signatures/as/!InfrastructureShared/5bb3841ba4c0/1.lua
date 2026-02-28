local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1()
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L1_1 = contains
L2_1 = L0_1
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%systemdrive%"
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L3_1(L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ":\\programData\\"
L3_1 = ":\\perflogs\\"
L4_1 = ":\\windows\\help\\"
L5_1 = ":\\windows\\debug\\"
L6_1 = ":\\windows\\tapi\\"
L7_1 = ":\\windows\\temp\\"
L8_1 = ":\\wmpub\\"
L9_1 = ":\\intel\\"
L10_1 = "\\music\\"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.command_line
  if L3_1 ~= nil then
    L3_1 = {}
    L4_1 = "mega"
    L5_1 = "webdav"
    L6_1 = "copy"
    L7_1 = "ftp"
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L3_1[3] = L6_1
    L3_1[4] = L7_1
    L4_1 = contains
    L5_1 = L2_1.command_line
    L6_1 = L3_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = bm
      L4_1 = L4_1.add_threat_file
      L5_1 = L0_1
      L4_1(L5_1)
      L4_1 = reportSessionInformationInclusive
      L4_1()
      L4_1 = add_parents
      L4_1()
      L4_1 = reportTimingData
      L4_1()
      L4_1 = pcall
      L5_1 = reportBmInfo
      L4_1, L5_1 = L4_1(L5_1)
      if not L4_1 and L5_1 then
        L6_1 = bm
        L6_1 = L6_1.add_related_string
        L7_1 = "bmInfoFailReason"
        L8_1 = tostring
        L9_1 = L5_1
        L8_1 = L8_1(L9_1)
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
      end
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
