local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[9]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[10]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
    end
  end
end
L2_1 = GetFileName
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "bedvitcom"
L3_1[1] = L4_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = contains
L5_1 = L1_1
L6_1 = L2_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
