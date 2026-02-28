local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L0_1 = L4_1.utf8p2
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L4_1 = L4_1.utf8p2
      if L4_1 ~= "" then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L0_1 = L4_1.utf8p2
      end
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L1_1 = L4_1.utf8p1
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[6]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L3_1 = L4_1.utf8p1
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L2_1 = L4_1.utf8p2
    end
  end
end
L4_1 = IsKeyValuePairInRollingQueue
L5_1 = "MAC_UNS_ADHOC_PATHS"
L6_1 = "unsigned_adhoc_items"
L7_1 = L3_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L1_1
L4_1 = L1_1.match
L6_1 = "[^/]*$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L2_1
L7_1 = L4_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = L4_1
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
