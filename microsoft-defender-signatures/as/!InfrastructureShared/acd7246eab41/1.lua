-- Threat: !InfrastructureShared
-- Name: acd7246eab41
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if not l_0_0 or not l_0_0.image_path then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = checkFileLastWriteTime(l_0_1, 120)
if l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
