local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L0_1["node.exe"] = true
L0_1["masvc.exe"] = true
L0_1["ltsvc.exe"] = true
L0_1["java.exe"] = true
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = L0_1[L3_1]
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L2_1 = TrackPidAndTechnique
L3_1 = "CMDHSTR"
L4_1 = "T1057"
L5_1 = "process_discovery"
L2_1(L3_1, L4_1, L5_1)
L2_1 = IsDetectionThresholdMet
L3_1 = "CMDHSTR"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.LOWFI
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
