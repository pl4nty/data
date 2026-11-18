-- Threat: !InfrastructureShared
-- Name: c2d71e94e203
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["cscan.exe"] = true,
    ["ciscod.exe"] = true,
    ["abtsvchost_.exe"] = true,
    ["m_agent_service.exe"] = true,
    ["printixservice.exe"] = true,
    ["cthwiprvservice.exe"] = true,
    ["hpcommrecovery.exe"] = true,
    ["safeconnect.entry.exe"] = true,
    ["touchpointanalyticsclient.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  if l_0_1:find("\\powershell.exe") then
    local l_0_4 = mp.GetProcessCommandLine(l_0_0.ppid)
    if l_0_4 ~= nil then
      l_0_4 = string.lower(l_0_4)
      if l_0_4:find("\\microsoft\\windows defender advanced threat protection\\datacollection\\", 1, true) then
        return mp.CLEAN
      end
    end
  end
end
TrackPidAndTechnique("CMDHSTR", "T1016", "network_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.LOWFI
