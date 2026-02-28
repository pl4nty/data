local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BM_MZ_FILE"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "BM_CONTAINER_FILE"
  L0_1 = L0_1(L1_1)
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetMOTWZone
L1_1 = L1_1()
if L1_1 == nil or L1_1 < 3 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetMOTWReferrerUrl
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = normalize_path
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = "ArchiveTracker"
L4_1 = "InterestingZip.A"
L5_1 = pcall
L6_1 = MpCommon
L6_1 = L6_1.RollingQueueQueryKeyNamespaced
L7_1 = L4_1
L8_1 = L3_1
L9_1 = L2_1
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 and L6_1 ~= nil then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:MotWFromIntZip"
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:MotWFromIntZip"
  L9_1 = "_"
  L10_1 = L6_1.value
  L8_1 = L8_1 .. L9_1 .. L10_1
  L7_1(L8_1)
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
