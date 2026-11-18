-- Threat: !InfrastructureShared
-- Name: 46d7c65e4936
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["ossec-agent.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1135", "network_share_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
