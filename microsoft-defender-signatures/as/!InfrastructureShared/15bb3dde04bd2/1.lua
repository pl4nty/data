local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = IsADConnectRole
L0_1 = L0_1()
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L1_1 = L2_1.utf8p1
end
if L0_1 ~= nil and L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L4_1 = L0_1
  L3_1 = L0_1.match
  L5_1 = "([^\\]+)$"
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  L3_1 = string
  L3_1 = L3_1.lower
  L5_1 = L1_1
  L4_1 = L1_1.match
  L6_1 = "([^\\]+)$"
  L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L2_1 == L3_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
