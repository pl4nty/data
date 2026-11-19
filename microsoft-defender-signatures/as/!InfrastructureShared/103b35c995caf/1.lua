-- Threat: !InfrastructureShared
-- Name: 103b35c995caf
-- Type: 21

local l_0_0
if this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p2
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == nil or string.find(l_0_0, "^%%", 0) or mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
return mp.INFECTED
