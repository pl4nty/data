local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = reportAVExcludedEntities
L0_1 = L0_1()
L1_1 = next
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "Exclusion_API"
  L3_1 = "sysio"
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsAVExcluded
L3_1 = L1_1
L2_1, L3_1 = L2_1(L3_1)
if L2_1 then
  L4_1 = bm
  L4_1 = L4_1.add_related_string
  L5_1 = "Exclusion_API"
  L6_1 = "LUA"
  L7_1 = bm
  L7_1 = L7_1.RelatedStringBMReport
  L4_1(L5_1, L6_1, L7_1)
  if L3_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "Effective_Exclusion"
    L6_1 = L3_1
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
