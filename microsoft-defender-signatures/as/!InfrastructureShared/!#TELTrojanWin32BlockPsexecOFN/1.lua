local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "d1e49aac-8f56-4280-b9ba-993a6d77406c"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1 = L1_1()
L0_1 = L1_1
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.IsPathExcludedForHipsRule
L3_1 = L1_1
L4_1 = "d1e49aac-8f56-4280-b9ba-993a6d77406c"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
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
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSDEVICEPATH
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
if L2_1 == "psexesvc.exe" then
  L5_1 = MpCommon
  L5_1 = L5_1.ExpandEnvironmentVariables
  L6_1 = "%systemroot%"
  L5_1 = L5_1(L6_1)
  if L5_1 == nil or L5_1 == "" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = MpCommon
  L6_1 = L6_1.PathToWin32Path
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  if L5_1 == nil or L5_1 == "" then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  if L4_1 == L5_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L5_1 = L4_1
L6_1 = "\\"
L7_1 = L2_1
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = MpCommon
L6_1 = L6_1.GetOriginalFileName
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 == "psexesvc.exe" then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "MpDisableCaching"
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.SetHipsRule
  L7_1 = "d1e49aac-8f56-4280-b9ba-993a6d77406c"
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.BLOCKEXECUTION
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
