-- Threat: !InfrastructureShared
-- Name: 69b3e52c2b2d
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "psscriptpolicytest", 1, true) or string.find(l_0_1, "firefox.ps1", 1, true) or string.find(l_0_1, "casascreensaver", 1, true) then
    return mp.CLEAN
  end
end
local l_0_2
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_2, "([^\\]+)$")
if l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_3, "\"casascreensaver.scr\"", 1, true) or string.find(l_0_3, "\"firefox\"", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
