-- Threat: !InfrastructureShared
-- Name: 69b371da5826
-- Type: 21

local l_0_0 = "(.+\\)[^\\]+%."
local l_0_1 = string.match(string.lower(this_sigattrlog[1].utf8p1), l_0_0)
local l_0_2 = string.match(string.lower(this_sigattrlog[2].utf8p1), l_0_0)
local l_0_3 = string.match(string.lower(this_sigattrlog[3].utf8p1), l_0_0)
local l_0_4
if this_sigattrlog[4].matched then
  l_0_4 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_4 = this_sigattrlog[5].utf8p1
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = string.match(string.lower(l_0_4), l_0_0)
if l_0_1 ~= nil and l_0_1 == l_0_2 and l_0_1 == l_0_3 and l_0_1 == l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
