-- Threat: !InfrastructureShared
-- Name: 99d75f2c6cce
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["ossec-agent.exe"] = true,
    ["911 location manager.exe"] = true,
    ["ltsvc.exe"] = true,
    ["cscan.exe"] = true,
    ["ciscod.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1018", "remote_system_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.LOWFI
