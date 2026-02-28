local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "MassRecon_H_Machine_Event"
  L3_1 = L0_1
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = GetRollingQueue
  L2_1 = "ReconTracking"
  L1_1 = L1_1(L2_1)
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "MassRecon_H_Machine"
  L4_1 = safeJsonSerialize
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L0_1 = reportSessionInformationInclusive
L0_1()
L0_1 = reportTimingData
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
