local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.Base64Encode
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = GetRollingQueueKeyValue
L4_1 = "rq_fileremotedrop"
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L0_1 = L4_1
if L0_1 == "" or L0_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.GetOriginalFileName
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L5_1 = false
if L4_1 == "psexesvc.exe" or L4_1 == "psexec.c" then
  L5_1 = true
  L6_1 = AppendToRollingQueue
  L7_1 = "renamed_psexec"
  L8_1 = L3_1
  L9_1 = L2_1
  L10_1 = 600
  L11_1 = 1
  L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
end
if not L5_1 then
  L6_1 = GetRollingQueueKeyValue
  L7_1 = "renamed_psexec"
  L8_1 = L3_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == L2_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = {}
  L8_1 = "\\windows\\temp\\ot-"
  L9_1 = "systeminsights.capabilities.anomalydetection"
  L7_1[1] = L8_1
  L7_1[2] = L9_1
  L8_1 = contains
  L9_1 = L0_1
  L10_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = {}
  L8_1["c:\\programdata"] = true
  L8_1["c:\\perflogs"] = true
  L8_1["c:\\windows\\help"] = true
  L8_1["c:\\windows\\debug"] = true
  L8_1["c:\\windows\\tapi"] = true
  L8_1["c:\\windows\\temp"] = true
  L8_1["c:\\intel"] = true
  L8_1["c:\\users\\public"] = true
  L9_1 = L8_1[L0_1]
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
