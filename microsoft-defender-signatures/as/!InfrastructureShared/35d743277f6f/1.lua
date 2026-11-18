-- Threat: !InfrastructureShared
-- Name: 35d743277f6f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["vmtoolsd.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1049", "network_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
