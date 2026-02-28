local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= "" then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L0_1 = L2_1.utf8p2
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= "" then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L1_1 = L2_1.utf8p1
    end
  end
end
if L1_1 ~= nil and L1_1 ~= "" and L0_1 ~= nil and L0_1 ~= "" then
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "/([^/]+%.app)"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil and L2_1 ~= "" then
    L4_1 = L0_1
    L3_1 = L0_1.find
    L5_1 = L2_1
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = reportRelatedBmHits
      L3_1()
      L3_1 = bm
      L3_1 = L3_1.trigger_sig
      L4_1 = "BmTraverseTreeBlockMac"
      L5_1 = "Detected"
      L3_1(L4_1, L5_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
