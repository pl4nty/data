local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L1_1 = L3_1.image_path
end
if L0_1 ~= nil and L1_1 ~= nil then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1
  L6_1 = "T1087"
  L7_1 = "user_discovery"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = IsDetectionThresholdMet
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
