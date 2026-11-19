-- Threat: !InfrastructureShared
-- Name: 32b30808bded
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = "(?i)tiworker.exe\"?'?\\s+\\S{56,}"
local l_0_2, l_0_3 = MpCommon.StringRegExpSearch(l_0_1, l_0_0)
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
