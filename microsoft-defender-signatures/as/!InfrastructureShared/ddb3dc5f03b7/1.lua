local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = " /i "
L5_1 = " /q "
L6_1 = " -i "
L7_1 = " -q "
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "msiexec%.?e?x?e?\"?'?%s+(.*)$"
  L1_1 = L1_1(L2_1, L3_1)
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
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
