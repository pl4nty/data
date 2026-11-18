-- Threat: !InfrastructureShared
-- Name: 43b3bbf65f54
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "get-netipconfiguration",
  "ipv4defaultgateway",
  "invoke-restmethod",
  "b64xorencode",
  "polltask"
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
