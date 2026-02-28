local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "msiexec%.?e?x?e?\"?'?%s+(.*)$"
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L2_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L1_1
L4_1 = {}
L5_1 = ".msi"
L6_1 = ".exe"
L4_1[1] = L5_1
L4_1[2] = L6_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
