-- Threat: !InfrastructureShared
-- Name: 41b30ab2e78f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, true, false) == false then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
