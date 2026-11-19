-- Threat: !InfrastructureShared
-- Name: 9cb3a6ff2356
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if checkFileLastWriteTime(l_0_0, 3600) ~= false then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.GetMotwZoneForFile(l_0_0)
if l_0_2 ~= nil and 3 <= l_0_2 then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
