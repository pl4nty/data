-- Threat: !InfrastructureShared
-- Name: 41b3e4e9191f
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
local l_0_1 = string.lower(string.sub(l_0_0, -11))
if l_0_1 == "\\target.lnk" then
  return mp.CLEAN
end
return mp.INFECTED
