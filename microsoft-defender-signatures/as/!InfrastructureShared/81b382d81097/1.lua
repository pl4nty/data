-- Threat: !InfrastructureShared
-- Name: 81b382d81097
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
local l_0_1 = string.lower(string.sub(l_0_0, -1))
if l_0_1 ~= "\\" or l_0_1 ~= "/" then
  return mp.INFECTED
end
return mp.CLEAN
