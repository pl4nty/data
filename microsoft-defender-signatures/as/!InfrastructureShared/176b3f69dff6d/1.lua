local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L6_1 = this_sigattrlog
L6_1 = L6_1[6]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[6]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[6]
    L0_1 = L6_1.utf8p1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[7]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[7]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[7]
    L1_1 = L6_1.utf8p1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[8]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[8]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[8]
    L2_1 = L6_1.utf8p1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[9]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[9]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[9]
    L3_1 = L6_1.utf8p1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[10]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[10]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[10]
    L4_1 = L6_1.utf8p1
  end
end
L6_1 = this_sigattrlog
L6_1 = L6_1[11]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[11]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[11]
    L5_1 = L6_1.utf8p1
  end
end
if L0_1 ~= nil and L0_1 == L1_1 and L1_1 == L2_1 and L2_1 == L3_1 and L3_1 == L4_1 and L4_1 == L5_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
