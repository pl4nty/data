-- Threat: !InfrastructureShared
-- Name: 63b3d438102a
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = l_0_0:match("create%s(.*)")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = false
for l_0_3 in l_0_1:gmatch("([a-z]?:?[^/]\\?[a-z0-9.\\ ]*:[^\\][a-z0-9.]*)") do
  if sysio.IsFileExists(l_0_3) then
    bm.add_related_file(l_0_3)
    l_0_2 = true
  end
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
