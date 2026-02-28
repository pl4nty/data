local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = hstrlog
if L3_1 then
  L3_1 = hstrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = SetPersistContextNoPath
    L4_1 = "SymLinkCreatedForMDE_AV"
    L5_1 = "true"
    L3_1 = L3_1(L4_1, L5_1)
    L2_1 = L3_1
end
else
  L3_1 = SetPersistContextNoPath
  L4_1 = "SymLinkCreatedForMDE_EDR"
  L5_1 = "true"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
end
if not L2_1 then
  L3_1 = set_research_data
  L4_1 = "Error"
  L5_1 = "Failed to persist NewSymlinkAddedForMDE attrib"
  L6_1 = false
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = set_research_data
L4_1 = "Link_Added"
L5_1 = MpCommon
L5_1 = L5_1.Base64Encode
L6_1 = L1_1
L5_1 = L5_1(L6_1)
L6_1 = false
L3_1(L4_1, L5_1, L6_1)
L3_1 = GetPersistContextValueForKeyRegex
L4_1 = "NewServiceRegistered_LoadsBeforeEdr"
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = set_research_data
  L5_1 = "NewServiceRegistered_LoadsBeforeEdr"
  L6_1 = MpCommon
  L6_1 = L6_1.Base64Encode
  L7_1 = safeJsonSerialize
  L8_1 = L3_1
  L7_1, L8_1 = L7_1(L8_1)
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = false
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = GetPersistContextValueForKeyRegex
L5_1 = "NewServiceRegistered_LoadsBeforeAV"
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 then
  L4_1 = set_research_data
  L5_1 = "NewServiceRegistered_LoadsBeforeAV"
  L6_1 = MpCommon
  L6_1 = L6_1.Base64Encode
  L7_1 = safeJsonSerialize
  L8_1 = L3_1
  L7_1, L8_1 = L7_1(L8_1)
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = false
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
