-- Threat: !InfrastructureShared
-- Name: 5bb31e884d88
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0, l_0_1
local l_0_2 = "RcloneMega"
local l_0_3 = "|"
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[1].ppid
end
local l_0_4 = l_0_0 .. l_0_3 .. l_0_1
local l_0_5 = GetRollingQueueKeyValue(l_0_2, l_0_4)
if l_0_5 ~= nil or type(l_0_5) == "table" then
  bm.add_related_string(l_0_2, safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
end
reportSessionInformation()
return mp.INFECTED
