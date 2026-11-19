-- Threat: !InfrastructureShared
-- Name: 2db3eb6b3adf
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0:find("hkey", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
