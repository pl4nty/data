-- Threat: !InfrastructureShared
-- Name: 41b3e231508c
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = {
  l_0_0:match("/D:(%d+)%.(%d+)%.(%d+)%.(%d+)")
}
if #l_0_1 == 4 then
  return mp.CLEAN
end
return mp.INFECTED
