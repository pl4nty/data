local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1["iaprintmanager.exe"] = true
  L3_1["sdiagnhost.exe"] = true
  L3_1["qq.exe"] = true
  L3_1["printixservice.exe"] = true
  L3_1["lnsscomm.exe"] = true
  L3_1["webexmta.exe"] = true
  L3_1["supportassistagent.exe"] = true
  L3_1["vpnagent.exe"] = true
  L3_1["ossec-agent.exe"] = true
  L3_1["pangps.exe"] = true
  L3_1["cthwiprvservice.exe"] = true
  L3_1["ctesdursvc.exe"] = true
  L3_1["node.exe"] = true
  L3_1["heimdal.darklayerguard.exe"] = true
  L3_1["fortisslvpndaemon.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = TrackPidAndTechnique
L2_1 = "CMDHSTR"
L3_1 = "T1016"
L4_1 = "network_discovery"
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
