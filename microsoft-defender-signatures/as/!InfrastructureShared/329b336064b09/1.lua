local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L2_1 = "microsoft.6365217ce6eb4_"
  L0_1 = L0_1(L1_1, L2_1)
  L1_1 = AppendToRollingQueue
  L2_1 = "DefenderForIdentity"
  L3_1 = "Version"
  L4_1 = L0_1
  L5_1 = 31104000
  L6_1 = 5
  L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
else
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = AppendToRollingQueue
    L1_1 = "DefenderForIdentity"
    L2_1 = "SupportedUsers"
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.np2
    L4_1 = 31104000
    L5_1 = 5
    L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
  else
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = pcall
      L1_1 = MpCommon
      L1_1 = L1_1.RollingQueueErase
      L2_1 = "DefenderForIdentity"
      L0_1(L1_1, L2_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
