local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L2_1, L3_1 = L2_1(L3_1)
if L2_1 and L3_1 ~= nil then
  L0_1 = L3_1.ppid
  L1_1 = L3_1.image_path
  if L1_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L1_1
  L4_1 = L1_1.match
  L6_1 = "([^\\]+)$"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = {}
  L5_1["ossec-agent.exe"] = true
  L5_1["qualysagent.exe"] = true
  L5_1["cscan.exe"] = true
  L5_1["ciscod.exe"] = true
  L5_1["ltsvc.exe"] = true
  L5_1["monitoringhost.exe"] = true
  L6_1 = L5_1[L4_1]
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
if L0_1 ~= nil and L1_1 ~= nil then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1
  L6_1 = "T1033"
  L7_1 = "user_discovery"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = IsDetectionThresholdMet
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.LOWFI
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
