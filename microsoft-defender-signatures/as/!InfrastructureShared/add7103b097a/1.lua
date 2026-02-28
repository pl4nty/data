local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1["springtoolsuite4.exe"] = true
  L3_1["microsoft.servicehub.controller.exe"] = true
  L3_1["devenv.exe"] = true
  L3_1["amazon-ssm-agent.exe"] = true
  L3_1["te-updater.exe"] = true
  L3_1["te-proxy.exe"] = true
  L3_1["te-iehelper.exe"] = true
  L3_1["gotoassistui.exe"] = true
  L3_1["gotoassistservice.exe"] = true
  L3_1["idea64.exe"] = true
  L3_1["te-user-agent.exe"] = true
  L3_1["monitoringhost.exe"] = true
  L3_1["qq.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = TrackPidAndTechnique
L2_1 = "CMDHSTR"
L3_1 = "T1033"
L4_1 = "session_discovery"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = "CMDHSTR"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.LOWFI
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
