-- Threat: !InfrastructureShared
-- Name: 41d70ef078de
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["ossec-agent.exe"] = true,
    ["qualysagent.exe"] = true,
    ["msexchangehmworker.exe"] = true,
    ["w32main2.exe"] = true,
    ["wagsrvc.exe"] = true,
    ["humvpnlogon.exe"] = true,
    ["imogenassistant.exe"] = true,
    ["imogenservice.exe"] = true,
    ["pedclient.wshost.exe"] = true,
    ["cscan.exe"] = true,
    ["ciscod.exe"] = true,
    ["ltsvc.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1018", "remote_system_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN
