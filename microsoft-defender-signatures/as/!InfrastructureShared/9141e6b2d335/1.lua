local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p1
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    L2_1 = AppendToRollingQueue
    L3_1 = "ExternalRemoteService_Path"
    L4_1 = L0_1
    L5_1 = 1
    L6_1 = 60
    L2_1(L3_1, L4_1, L5_1, L6_1)
    L2_1 = AppendToRollingQueue
    L3_1 = "ExternalRemoteService_PPid"
    L4_1 = L1_1
    L5_1 = 1
    L6_1 = 60
    L2_1(L3_1, L4_1, L5_1, L6_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
