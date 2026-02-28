local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
  L3_1["ossec-agent.exe"] = true
  L3_1["911 location manager.exe"] = true
  L3_1["ltsvc.exe"] = true
  L3_1["synchronizerweb.exe"] = true
  L3_1["rocketleague.exe"] = true
  L3_1["wssad.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "uninstallservice.cmd"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "ltrestart.bat"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      goto lbl_50
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
::lbl_50::
L2_1 = TrackPidAndTechnique
L3_1 = "CMDHSTR"
L4_1 = "T1018"
L5_1 = "remote_system_discovery"
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
L2_1 = L2_1.LOWFI
return L2_1
