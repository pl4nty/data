-- Threat: !InfrastructureShared
-- Name: 73d796dc259a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_4 = l_0_1:match("([^\\]+)$")
  local l_0_5 = {
    ["ossec-agent.exe"] = true,
    ["qualysagent.exe"] = true,
    ["cscan.exe"] = true,
    ["ciscod.exe"] = true,
    ["ltsvc.exe"] = true,
    ["monitoringhost.exe"] = true
  }
  if l_0_5[l_0_4] then
    return mp.CLEAN
  end
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  TrackPidAndTechnique(l_0_0, "T1033", "user_discovery")
  if IsDetectionThresholdMet(l_0_0) then
    return mp.LOWFI
  end
end
return mp.CLEAN
