-- Threat: !InfrastructureShared
-- Name: 66d7da63779c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
  local l_0_4 = string.lower(l_0_1)
  local l_0_5 = l_0_4:match("([^\\]+)$")
  if string.find(l_0_5, "fusioninventory-agent_windows", 1, true) or string.find(l_0_5, "ledkeeper2.exe", 1, true) or string.find(l_0_5, "deviceconfiguratorsetup.exe", 1, true) or string.find(l_0_5, "remote access.exe", 1, true) or string.find(l_0_5, "tailscaled.exe", 1, true) or string.find(l_0_5, "dsc5x", 1, true) or string.find(l_0_5, "dsc-5", 1, true) or string.find(l_0_5, "steamapps\\\\common\\\\delta force\\\\launcher\\\\service", 1, true) or string.find(l_0_5, "aemagent.exe", 1, true) or string.find(l_0_5, "papercut-hive-ca-", 1, true) or string.find(l_0_5, "skype.exe", 1, true) and string.find(l_0_4, ":\\program files", 1, true) then
    return mp.CLEAN
  end
  local l_0_6 = {
    "besclient.exe"
  }
  if IsProcNameInParentProcessTree("cmdhstr", l_0_6) then
    return mp.CLEAN
  end
  local l_0_7 = mp.GetScannedPPID()
  if not l_0_7 then
    return mp.CLEAN
  end
  local l_0_8 = mp.GetProcessCommandLine(l_0_7)
  if not l_0_8 then
    return mp.CLEAN
  end
  l_0_8 = string.lower(l_0_8)
  if string.find(l_0_8, "name=bes client", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_8, "bigfix enterprise\\bes client\\besclient.exe", 1, true) then
    return mp.CLEAN
  end
  if l_0_0 ~= nil and l_0_1 ~= nil then
    TrackPidAndTechnique(l_0_0, "T1562.004", "disablefirewall")
    if IsDetectionThresholdMet(l_0_0) then
      return mp.INFECTED
    end
  end
end
return mp.LOWFI
