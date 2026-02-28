local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = GetRealPidForScenario
L1_1 = "CMDHSTR"
L0_1 = L0_1(L1_1)
L1_1 = IsPidExcluded
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
    L2_1 = L1_1.image_path
    L3_1 = string
    L3_1 = L3_1.lower
    L5_1 = L2_1
    L4_1 = L2_1.match
    L6_1 = "([^\\]+)$"
    L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    L4_1 = {}
    L4_1["ccmexec.exe"] = true
    L4_1["gpscript.exe"] = true
    L4_1["mpcmdrun.exe"] = true
    L4_1["mssense.exe"] = true
    L4_1["senseir.exe"] = true
    L5_1 = L4_1[L3_1]
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
  end
end
L2_1 = TrackPidAndTechnique
L3_1 = L0_1
L4_1 = "T1003"
L5_1 = "shadowcopy_create"
L2_1(L3_1, L4_1, L5_1)
L2_1 = IsDetectionThresholdMet
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.LOWFI
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.LOWFI
return L2_1
