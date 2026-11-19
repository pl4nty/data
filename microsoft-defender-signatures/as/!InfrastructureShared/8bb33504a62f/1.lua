-- Threat: !InfrastructureShared
-- Name: 8bb33504a62f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 and this_sigattrlog[1].utf8p1 then
  l_0_2 = this_sigattrlog[1].utf8p1
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 and this_sigattrlog[4].utf8p1 then
  l_0_3 = this_sigattrlog[4].utf8p1
  l_0_1 = this_sigattrlog[4].utf8p2
end
if isnull(l_0_0) and isnull(l_0_1) then
  return mp.CLEAN
end
if l_0_0 ~= l_0_1 then
  return mp.CLEAN
end
local l_0_4 = {}
local l_0_5 = {}
for l_0_6, l_0_7 in string.gmatch(l_0_1, "(%w+):(%w+)") do
  l_0_4[l_0_6] = l_0_7
end
local l_0_8 = scrubData(l_0_4.usrname)
local l_0_9 = scrubData(l_0_4.domain)
local l_0_10 = l_0_4.remoteip
if l_0_8 ~= nil and l_0_9 ~= nil and l_0_10 ~= nil then
  table.insert(l_0_5, {
    RemoteClientUser = l_0_8,
    RemoteClientDomain = l_0_9,
    RemoteClientIP = l_0_10,
    l_0_3,
    l_0_2
  })
  bm.add_related_string("RemoteClientData_table", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
