-- Threat: !InfrastructureShared
-- Name: 348b366fcecbf
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
else
  return mp.CLEAN
end
if this_sigattrlog[9].matched then
  l_0_1 = this_sigattrlog[9].utf8p1
else
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("/users/([^/]+)/")
local l_0_3 = l_0_1:match("/users/([^/]+)/")
if l_0_3 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_4 = l_0_0:match("([^/]+)$")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_1:match("([^/]+).plist$")
if l_0_5 == nil then
  return mp.CLEAN
end
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
return mp.INFECTED
