-- Threat: !InfrastructureShared
-- Name: 2db340e85aa0
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("[%a]:\\[^\"%>%s]*%.dll")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = IsFileRecentlyDropped(l_0_1)
if l_0_2 and l_0_3 and l_0_4 then
  local l_0_5 = safeJsonDeserialize(l_0_4)
  if l_0_5 and l_0_5.UnsignedFile then
    return mp.INFECTED
  end
end
return mp.CLEAN
