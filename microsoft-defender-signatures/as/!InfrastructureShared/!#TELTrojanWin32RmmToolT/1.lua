local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetScanSource
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.SCANSOURCE_IOAV_WEB
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANSOURCE_IOAV_FILE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.SCANSOURCE_RTP
    if L0_1 ~= L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "putty"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= nil then
  L3_1 = MpCommon
  L3_1 = L3_1.IsSampled
  L4_1 = 99000
  L5_1 = false
  L6_1 = false
  L7_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = IsRmmToolFilePath
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = IsRmmToolVersionInfo
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = IsRmmToolOFN
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
