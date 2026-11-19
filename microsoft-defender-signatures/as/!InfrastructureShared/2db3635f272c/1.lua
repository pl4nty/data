-- Threat: !InfrastructureShared
-- Name: 2db3635f272c
-- Type: 21

local l_0_0 = "(.+\\)"
local l_0_1 = string.match(string.lower(this_sigattrlog[1].utf8p1), l_0_0)
local l_0_2 = string.match(string.lower(this_sigattrlog[2].utf8p1), l_0_0)
if l_0_1 ~= nil and l_0_1 == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
