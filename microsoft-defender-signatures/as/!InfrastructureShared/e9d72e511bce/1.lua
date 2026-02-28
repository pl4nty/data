local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = TrackPidAndTechnique
L2_1 = L0_1
L3_1 = "T1562.001"
L4_1 = "mptamper_mse7"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
