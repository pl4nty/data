-- Threat: !InfrastructureShared
-- Name: b9d7d998eaf4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
  local l_0_4 = string.lower(l_0_1)
  local l_0_5 = l_0_4:match("([^\\]+)$")
  local l_0_6 = {
    ["net.exe"] = true,
    ["gc_service.exe"] = true
  }
  if l_0_6[l_0_5] then
    return mp.CLEAN
  end
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  TrackPidAndTechnique(l_0_0, "T1069", "permission_groups_discovery")
  if IsDetectionThresholdMet("CMDHSTR") then
    return mp.LOWFI
  end
end
return mp.LOWFI
