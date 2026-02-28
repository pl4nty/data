local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.ppid
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L0_1.image_path
    L2_1 = L2_1(L3_1)
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = {}
    L4_1["circuit.exe"] = true
    L5_1 = L4_1[L3_1]
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = IsPidExcluded
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = TrackPidAndTechnique
    L6_1 = L1_1
    L7_1 = "T1021.006"
    L8_1 = "lolbin_wmic"
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = IsDetectionThresholdMet
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
    L5_1 = mp
    L5_1 = L5_1.LOWFI
    return L5_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
