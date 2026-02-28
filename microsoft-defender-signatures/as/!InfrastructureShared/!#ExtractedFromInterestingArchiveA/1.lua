local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
L1_1 = normalize_path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
if L1_1 ~= "explorer.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "BM_MZ_FILE"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "BM_CONTAINER_FILE"
  L2_1 = L2_1(L3_1)
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "ArchiveTracker"
L4_1 = "InterestingZip.A"
L5_1 = pcall
L6_1 = MpCommon
L6_1 = L6_1.RollingQueueQueryKVNamespaced
L7_1 = L4_1
L8_1 = L3_1
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 and L6_1 ~= nil then
  L7_1 = pairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L13_1 = L10_1
    L12_1 = L10_1.match
    L14_1 = "(.+\\)([^\\]+)$"
    L12_1, L13_1 = L12_1(L13_1, L14_1)
    L15_1 = L0_1
    L14_1 = L0_1.find
    L16_1 = L13_1
    L17_1 = 1
    L18_1 = true
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    if L14_1 ~= nil then
      L14_1 = mp
      L14_1 = L14_1.set_mpattribute
      L15_1 = "MpDisableCaching"
      L14_1(L15_1)
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
