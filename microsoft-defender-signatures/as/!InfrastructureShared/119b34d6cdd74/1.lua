-- Threat: !InfrastructureShared
-- Name: 119b34d6cdd74
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 and string.lower(string.sub(l_0_0, -3)) == "dll" then
  return mp.INFECTED
end
return mp.CLEAN
