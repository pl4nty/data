local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
  L3_1["cscan.exe"] = true
  L3_1["ciscod.exe"] = true
  L3_1["abtsvchost_.exe"] = true
  L3_1["m_agent_service.exe"] = true
  L3_1["printixservice.exe"] = true
  L3_1["cthwiprvservice.exe"] = true
  L3_1["hpcommrecovery.exe"] = true
  L3_1["safeconnect.entry.exe"] = true
  L3_1["touchpointanalyticsclient.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L1_1
  L4_1 = L1_1.find
  L6_1 = "\\powershell.exe"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.GetProcessCommandLine
    L5_1 = L0_1.ppid
    L4_1 = L4_1(L5_1)
    if L4_1 ~= nil then
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      L4_1 = L5_1
      L6_1 = L4_1
      L5_1 = L4_1.find
      L7_1 = "\\microsoft\\windows defender advanced threat protection\\datacollection\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
    end
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
L1_1 = L1_1.LOWFI
return L1_1
