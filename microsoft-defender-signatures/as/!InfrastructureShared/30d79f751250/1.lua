local L0_1, L1_1, L2_1, L3_1
L0_1 = IsPidExcluded
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = TrackPidAndTechnique
L1_1 = "CMDHSTR"
L2_1 = "T1218.011"
L3_1 = "lolbin_rundll"
L0_1(L1_1, L2_1, L3_1)
L0_1 = IsDetectionThresholdMet
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.LOWFI
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
