-- Threat: !InfrastructureShared
-- Name: 2e9b3e256f8f8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
  l_0_1 = this_sigattrlog[8].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_2 = l_0_0:match("node%.exe\"?%s+\"?([^\"]+%.js)\"?")
if not l_0_2 then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_2, 3600) ~= false then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_1, 3600) ~= false then
  return mp.CLEAN
end
bm.add_related_file(l_0_2)
return mp.INFECTED
