-- Threat: !InfrastructureShared
-- Name: 334b3456b353a
-- Type: 21

local l_0_0
if this_sigattrlog[19].matched and this_sigattrlog[19].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[19].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "/logrotate", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
