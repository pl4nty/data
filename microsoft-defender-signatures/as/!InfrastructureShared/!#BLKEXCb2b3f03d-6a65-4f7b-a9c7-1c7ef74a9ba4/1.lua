local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
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
L0_1 = string
L0_1 = L0_1.lower
L1_1 = string
L1_1 = L1_1.sub
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1 = L2_1(L3_1)
L3_1 = -4
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 ~= ".msi" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 ~= "msiexec.exe" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.IsTrustedFile
L1_1 = false
L0_1, L1_1 = L0_1(L1_1)
if L0_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
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
L3_1 = L4_1
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.IsPathExcludedForHipsRule
L5_1 = L3_1
L6_1 = "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L3_1
L6_1 = L2_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpDisableCaching"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
else
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_DEVICE_CHARACTERISTICS
  L4_1 = L4_1(L5_1)
  L5_1 = mp
  L5_1 = L5_1.bitand
  L6_1 = L4_1
  L7_1 = 264193
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= 264193 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = MpCommon
  L5_1 = L5_1.ExpandEnvironmentVariables
  L6_1 = "%systemdrive%"
  L5_1 = L5_1(L6_1)
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
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = "^"
  L9_1 = L5_1
  L8_1 = L8_1 .. L9_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "MpDisableCaching"
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.GetPersistContextCount
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 == 0 then
  L4_1 = {}
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L4_1
  L7_1 = L2_1
  L5_1(L6_1, L7_1)
  L5_1 = MpCommon
  L5_1 = L5_1.SetPersistContext
  L6_1 = L3_1
  L7_1 = L4_1
  L8_1 = 0
  L5_1(L6_1, L7_1, L8_1)
else
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L3_1
  L6_1 = L2_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = MpCommon
    L4_1 = L4_1.AppendPersistContext
    L5_1 = L3_1
    L6_1 = L2_1
    L7_1 = 0
    L4_1(L5_1, L6_1, L7_1)
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
