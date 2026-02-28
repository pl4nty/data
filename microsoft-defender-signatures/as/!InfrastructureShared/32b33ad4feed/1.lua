local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = add_parents_mp
L0_1 = L0_1()
L1_1 = {}
L1_1.parents_info_mp = L0_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1.parent_OFN = L2_1
  end
end
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.ImagePath
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.ContextualExpandEnvironmentVariables
    L8_1 = L6_1.ImagePath
    L7_1 = L7_1(L8_1)
    L8_1 = contains
    L9_1 = L7_1
    L10_1 = "onedrive"
    L8_1 = L8_1(L9_1, L10_1)
    if L8_1 then
      L8_1 = bm
      L8_1 = L8_1.add_threat_file
      L9_1 = L7_1
      L8_1(L9_1)
      break
    end
  end
end
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "Additional_Info"
L4_1 = safeJsonSerialize
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
