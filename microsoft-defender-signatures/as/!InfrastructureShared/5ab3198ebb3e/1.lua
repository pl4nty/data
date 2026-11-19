-- Threat: !InfrastructureShared
-- Name: 5ab3198ebb3e
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
local l_0_1 = l_0_0:match("[%a]:\\[^\"%>%s]*%.dll")
if not l_0_1 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
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
