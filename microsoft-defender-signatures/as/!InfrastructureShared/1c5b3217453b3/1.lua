local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = ""
L1_1 = ""
L2_1 = ""
L3_1 = this_sigattrlog
L3_1 = L3_1[8]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[8]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
    if L0_1 ~= "" then
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L0_1
      L5_1 = true
      L6_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == false then
        L3_1 = bm
        L3_1 = L3_1.add_threat_file
        L4_1 = L0_1
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[9]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[9]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
    if L1_1 ~= "" then
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L1_1
      L5_1 = true
      L6_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == false then
        L3_1 = bm
        L3_1 = L3_1.add_threat_file
        L4_1 = L1_1
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[10]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[10]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[10]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    if L2_1 ~= "" then
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L2_1
      L5_1 = true
      L6_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == false then
        L3_1 = bm
        L3_1 = L3_1.add_threat_file
        L4_1 = L2_1
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
