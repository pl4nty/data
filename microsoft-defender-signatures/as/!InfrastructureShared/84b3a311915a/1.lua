local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
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
L1_1 = contains
L2_1 = L0_1
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%systemdrive%"
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ":\\windows\\"
L3_1 = ":\\users\\public\\"
L4_1 = ":\\recovery\\"
L5_1 = "c:\\temp\\"
L6_1 = "\\downloads\\"
L7_1 = ":\\ProgramData\\backup\\"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
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
      L4_1 = L4_1.add_related_file
      L5_1 = L0_1
      L4_1(L5_1)
      L4_1 = reportSessionInformation
      L4_1()
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
