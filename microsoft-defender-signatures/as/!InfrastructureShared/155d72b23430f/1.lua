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
  L3_1["sdiagnhost.exe"] = true
  L3_1["qualysagent.exe"] = true
  L3_1["pulsesecureservice.exe"] = true
  L3_1["javaw.exe"] = true
  L3_1["java.exe"] = true
  L3_1["ruby.exe"] = true
  L3_1["logmein.exe"] = true
  L3_1["fasm.exe"] = true
  L3_1["911 location manager.exe"] = true
  L3_1["ltsvc.exe"] = true
  L3_1["jumpcloud-agent.exe"] = true
  L3_1["vmtoolsd.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = TrackPidAndTechnique
L2_1 = "CMDHSTR"
L3_1 = "T1047"
L4_1 = "windows_management_instrumentation"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = "CMDHSTR"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
