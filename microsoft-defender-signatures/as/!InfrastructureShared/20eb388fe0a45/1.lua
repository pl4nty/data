-- Threat: !InfrastructureShared
-- Name: 20eb388fe0a45
-- Type: 21

local l_0_0
if this_sigattrlog[20].matched then
  l_0_0 = string.lower(this_sigattrlog[20].utf8p2)
end
local l_0_1
if string.find(l_0_0, "disablerealtimemonitoring $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "disablebehaviormonitoring $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "disableblockatfirstseen $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "disableioavprotection $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "disableprivacymode $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "disableintrusionpreventionsystem $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "disablescriptscanning $true", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "severethreatdefaultaction 6", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "lowthreatdefaultaction 6", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "moderatethreatdefaultaction 6", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "mapsreporting disabled", 1, true) then
  l_0_1 = l_0_1 + 1
end
if string.find(l_0_0, "enablecontrolledfolderaccess disabled", 1, true) then
  l_0_1 = l_0_1 + 1
end
if 2 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
