-- Threat: !InfrastructureShared
-- Name: 8db3f4a3d048
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p1 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("([^/]+)$")
if l_0_1 ~= "" and l_0_1 ~= nil and #l_0_1 == 8 and not l_0_1:find("[^0-9A-Fa-f]") then
  return mp.INFECTED
end
return mp.CLEAN
