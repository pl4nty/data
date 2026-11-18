-- Threat: !InfrastructureShared
-- Name: 4ab3191c6fbf
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {"\\appdata\\", "\\temp\\"}
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("([a-zA-Z]:\\[^\"%s<>]*%.exe)")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = IsFileRecentlyDropped(l_0_2)
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
