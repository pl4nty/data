local L0_1, L1_1, L2_1, L3_1, L4_1
L4_1 = this_sigattrlog
L4_1 = L4_1[11]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[11]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[11]
    L0_1 = L4_1.utf8p2
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[12]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[12]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[12]
    L1_1 = L4_1.utf8p2
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[13]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[13]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[13]
    L2_1 = L4_1.utf8p2
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[14]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[14]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[14]
    L3_1 = L4_1.utf8p2
  end
end
if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" and L2_1 ~= nil and L2_1 ~= "" and L3_1 ~= nil and L3_1 ~= "" and L0_1 ~= L1_1 and L0_1 ~= L2_1 and L0_1 ~= L3_1 and L1_1 ~= L2_1 and L1_1 ~= L3_1 and L2_1 ~= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
