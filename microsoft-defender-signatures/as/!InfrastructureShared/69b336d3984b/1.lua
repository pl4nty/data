-- Threat: !InfrastructureShared
-- Name: 69b336d3984b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = {}
local l_0_2 = 3600
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 ~= nil then
  table.insert(l_0_1, l_0_0)
end
if 0 < #l_0_1 then
  setMalwareManifest(l_0_1, l_0_2)
  return mp.INFECTED
end
return mp.CLEAN
