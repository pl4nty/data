local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = safeJsonDeserialize
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    L1_1 = tonumber
    L2_1 = L0_1.append_size
    L1_1 = L1_1(L2_1)
    if 1000 <= L1_1 then
      L1_1 = L0_1.appended_ext
      L2_1 = L1_1
      L1_1 = L1_1.lower
      L1_1 = L1_1(L2_1)
      if L1_1 == ".play" then
        L1_1 = reportTimingData
        L1_1()
        L1_1 = bm
        L1_1 = L1_1.add_related_string
        L2_1 = "file_append_meta"
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L3_1 = L3_1.utf8p2
        L4_1 = bm
        L4_1 = L4_1.RelatedStringBMReport
        L1_1(L2_1, L3_1, L4_1)
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
