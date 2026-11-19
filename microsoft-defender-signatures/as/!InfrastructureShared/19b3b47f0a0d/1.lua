-- Threat: !InfrastructureShared
-- Name: 19b3b47f0a0d
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("[%a]:\\[^\"%>%s]*%.dll")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[1].utf8p2
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
if string.find(l_0_3, "\\windows\\system32", 1, true) or string.find(l_0_3, "\\windows\\syswow64", 1, true) then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6 = IsFileRecentlyDropped(l_0_1)
if l_0_4 and l_0_5 and l_0_6 then
  local l_0_7 = safeJsonDeserialize(l_0_6)
  if l_0_7 and l_0_7.UnsignedFile then
    return mp.INFECTED
  end
end
return mp.CLEAN
