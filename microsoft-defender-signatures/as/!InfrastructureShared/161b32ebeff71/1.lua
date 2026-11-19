-- Threat: !InfrastructureShared
-- Name: 161b32ebeff71
-- Type: 21

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2:lower()
end
if #l_0_0 < 62 then
  return mp.CLEAN
end
return mp.INFECTED
