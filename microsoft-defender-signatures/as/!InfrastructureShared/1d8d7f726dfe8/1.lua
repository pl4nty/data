-- Threat: !InfrastructureShared
-- Name: 1d8d7f726dfe8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_4 = string.lower(l_0_1)
  if l_0_4.find("\\program files\\wsl\\wsl.exe", 1, true) then
    return mp.CLEAN
  end
  TrackPidAndTechnique(l_0_0, "T1087", "user_discovery")
  if IsDetectionThresholdMet(l_0_0) then
    return mp.INFECTED
  end
end
return mp.LOWFI
