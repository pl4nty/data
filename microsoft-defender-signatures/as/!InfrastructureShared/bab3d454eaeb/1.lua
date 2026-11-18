-- Threat: !InfrastructureShared
-- Name: bab3d454eaeb
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 31)
if l_0_1 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
