-- Threat: !InfrastructureShared
-- Name: 55b34f9d5f2a
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil and string.len(l_0_0) > 3 and (string.find(l_0_0, " whoami", 1, true) or string.find(l_0_0, " quser", 1, true) or string.find(l_0_0, " type ", 1, true) or string.find(l_0_0, " nltest", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
