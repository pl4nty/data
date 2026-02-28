local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".exe"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = contains
  L2_1 = L0_1
  L3_1 = {}
  L4_1 = "installer"
  L5_1 = "program files"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
