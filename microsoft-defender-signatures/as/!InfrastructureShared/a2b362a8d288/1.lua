-- Threat: !InfrastructureShared
-- Name: a2b362a8d288
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil or l_0_0 == "" or string.find(l_0_0, "/var/log/audit/", 1, true) or string.find(l_0_0, "_audit.log.gz", 1, true) or string.find(l_0_0, ".amazonaws.com ", 1, true) then
  return mp.CLEAN
end
if string.match(l_0_0, "%d+%.%d+%.%d+%.%d+") then
  return mp.INFECTED
end
return mp.CLEAN
