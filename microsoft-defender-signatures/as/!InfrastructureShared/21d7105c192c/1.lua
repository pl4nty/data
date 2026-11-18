-- Threat: !InfrastructureShared
-- Name: 21d7105c192c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  if l_0_1:find("fsprocsvc", 1, true) then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_0) then
    return mp.CLEAN
  end
  if IsTechniqueObservedForPid(l_0_0, "T1036") then
    TrackPidAndTechnique(l_0_0, "T1036", "child_of_masq")
    return mp.LOWFI
  end
end
return mp.CLEAN
