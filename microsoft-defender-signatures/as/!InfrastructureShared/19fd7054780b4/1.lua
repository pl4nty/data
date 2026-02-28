local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "windows\\ccm\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1["ir_agent.exe"] = true
  L3_1["gpscript.exe"] = true
  L3_1["xendesktopvdasetup.exe"] = true
  L3_1["icaconfigconsole.exe"] = true
  L3_1["matrix42uemagentupdate.exe"] = true
  L3_1["sia2.exe"] = true
  L3_1["smsswd.exe"] = true
  L3_1["tsmanager.exe"] = true
  L3_1["ruby.exe"] = true
  L3_1["bpbkar32.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L1_1 = TrackPidAndTechnique
L2_1 = "CMDHSTR"
L3_1 = "T1003.005"
L4_1 = "creddiscovery"
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
