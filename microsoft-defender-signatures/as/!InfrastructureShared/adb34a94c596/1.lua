local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= "" then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[1]
      L0_1 = L2_1.utf8p2
    end
  end
end
L2_1 = ""
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L1_1 = L3_1.utf8p2
      L3_1 = "SuspiciousPathMatch: "
      L4_1 = L1_1
      L2_1 = L3_1 .. L4_1
  end
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= "" then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L1_1 = L3_1.utf8p2
        L3_1 = "SuspiciousPathNameMatch: "
        L4_1 = L1_1
        L2_1 = L3_1 .. L4_1
    end
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p2
        if L3_1 ~= "" then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L1_1 = L3_1.utf8p2
          L3_1 = "SuspiciousHighConfMatch: "
          L4_1 = L1_1
          L2_1 = L3_1 .. L4_1
        end
      end
    end
  end
end
if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" and L2_1 ~= "" then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "SuspAttrMatch"
  L5_1 = L0_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "SuspMatchType"
  L5_1 = L2_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L1_1
  L3_1(L4_1)
  L3_1 = reportRelatedBmHits
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
