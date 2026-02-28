local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L0_1 = L0_1(L1_1)
if not L0_1 then
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
L0_1 = peattributes
L0_1 = L0_1.isexe
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdriver
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "enghipscpy:blockaccess:3b576869-a4ec-4529-8536-b80a7769e899"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = mp
L1_1 = L1_1.IsPathExcludedForHipsRule
L2_1 = L0_1
L3_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = "%userprofile%"
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L2_1 = nil
if L1_1 ~= nil and L1_1 ~= "" then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "(%a:.*\\)[^\\]+$"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
end
if L2_1 ~= nil and L2_1 ~= "" then
  L4_1 = L0_1
  L3_1 = L0_1.find
  L5_1 = L2_1
  L6_1 = "[^\\]+\\appdata\\local\\apps\\2.0\\.+\\dealanalysistool.dll"
  L5_1 = L5_1 .. L6_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.IsTrustedFile
L4_1 = false
L3_1, L4_1 = L3_1(L4_1)
if L3_1 == true then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "MpDisableCaching"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
