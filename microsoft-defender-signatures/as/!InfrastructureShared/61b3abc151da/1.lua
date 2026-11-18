-- Threat: !InfrastructureShared
-- Name: 61b3abc151da
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
l_0_0 = string.match(l_0_0, "-f%s+(.+)"):gsub("%s*$", "")
l_0_1 = string.match(l_0_1, "/%a.+/(.+)$")
if l_0_0 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
