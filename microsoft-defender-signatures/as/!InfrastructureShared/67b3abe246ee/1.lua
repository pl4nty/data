local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = false
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
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = {}
L3_1 = "/i"
L4_1 = "/package"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "OFFICE"
L5_1 = "EMAILCLIENT"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = {}
L4_1.min = 1
L4_1.max = 5
L5_1 = QueryProcContext
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L1_1 = true
end
L5_1 = QueryProcContext
L6_1 = {}
L7_1 = "SCRIPTENG"
L6_1[1] = L7_1
L7_1 = {}
L7_1.min = 1
L7_1.max = 5
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = contains
  L6_1 = L0_1
  L7_1 = "%.msi"
  L8_1 = false
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if not L5_1 then
    L1_1 = true
  end
end
if L1_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
