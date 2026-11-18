-- Threat: !InfrastructureShared
-- Name: 93b3c8167708
-- Type: 21
-- Includes: AppomalyHelpers

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("[%a]:\\[^\"%>%s]*%.dll")
if not l_0_1 then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = IsFileRecentlyDropped(l_0_1)
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
