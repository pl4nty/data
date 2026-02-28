local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.utf8p1
    L1_1 = MpCommon
    L1_1 = L1_1.PathToWin32Path
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1 or L0_1
    if not L1_1 then
    end
    if not L0_1 then
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
    L1_1 = L1_1.IsKnownFriendlyFile
    L2_1 = L0_1
    L3_1 = true
    L4_1 = false
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = IsFileRecentlyDropped
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    if L1_1 then
      L4_1 = bm
      L4_1 = L4_1.add_related_string
      L5_1 = "RecentDll"
      L6_1 = L2_1
      L7_1 = "|"
      L8_1 = safeJsonDeserialize
      L9_1 = L3_1
      L8_1 = L8_1(L9_1)
      if not L8_1 then
        L8_1 = ""
      end
      L6_1 = L6_1 .. L7_1 .. L8_1
      L7_1 = bm
      L7_1 = L7_1.RelatedStringBMReport
      L4_1(L5_1, L6_1, L7_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
