-- Threat: !InfrastructureShared
-- Name: 1e7b307410148
-- Type: 21

local l_0_0 = this_sigattrlog[9]
if not (l_0_0 ~= nil and l_0_0.matched) or l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tonumber(l_0_1)
if l_0_2 <= 4096 then
  return mp.CLEAN
end
local l_0_3 = {
  [65536] = true,
  [1048576] = true
}
if l_0_3[l_0_2] then
  return mp.CLEAN
end
local l_0_4 = l_0_0.utf8p2
local l_0_5 = string.format("%s;regionsize:%s", l_0_4, l_0_1)
bm.add_related_string("ProtectVmInfo", l_0_5, bm.RelatedStringBMReport)
return mp.INFECTED
