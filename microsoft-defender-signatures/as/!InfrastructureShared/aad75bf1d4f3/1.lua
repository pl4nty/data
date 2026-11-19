-- Threat: !InfrastructureShared
-- Name: aad75bf1d4f3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  TrackPidAndTechnique(l_0_0, "T1087", "account_discovery")
  if IsDetectionThresholdMet(l_0_0) then
    return mp.LOWFI
  end
end
return mp.LOWFI
