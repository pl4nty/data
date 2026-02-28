local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.utf8p1
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.utf8p2
    if L0_1 ~= nil and L1_1 ~= nil then
      L2_1 = AppendToRollingQueue
      L3_1 = "BmMsSenseComponentTamperA"
      L4_1 = L0_1
      L5_1 = L1_1
      L6_1 = 180
      L2_1(L3_1, L4_1, L5_1, L6_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
