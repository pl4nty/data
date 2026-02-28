local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = bm
    L0_1 = L0_1.add_related_string
    L1_1 = "Evidence"
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L3_1 = bm
    L3_1 = L3_1.RelatedStringBMReport
    L0_1(L1_1, L2_1, L3_1)
    L0_1 = safeJsonDeserialize
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L1_1 = L0_1.FilePath
      if L1_1 then
        L1_1 = bm
        L1_1 = L1_1.add_related_file
        L2_1 = L0_1.FilePath
        L1_1(L2_1)
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
