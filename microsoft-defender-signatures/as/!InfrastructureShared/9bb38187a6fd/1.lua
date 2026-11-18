-- Threat: !InfrastructureShared
-- Name: 9bb38187a6fd
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[6].matched then
  l_0_2 = this_sigattrlog[6].utf8p1
  if l_0_2 ~= nil then
    l_0_0 = l_0_2
  end
end
if this_sigattrlog[7].matched then
  l_0_2 = this_sigattrlog[7].utf8p1
  if l_0_2 ~= nil then
    l_0_1 = l_0_2
  end
end
local l_0_3 = l_0_0:match("([^/]+)$")
local l_0_4 = l_0_1:match("([^/]+).plist")
if l_0_3 == l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
