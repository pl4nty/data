-- Threat: !InfrastructureShared
-- Name: 41b3c8fdd0e3
-- Type: 21

if mp.IsHipsRuleEnabled("b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4") ~= true then
  return mp.CLEAN
end
local l_0_0 = "enghipscpy:blockexecution:b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4"
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p1
  l_0_2 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p2
  l_0_2 = this_sigattrlog[2].utf8p1
else
  return mp.CLEAN
end
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "%", 1, true) ~= nil or string.find(l_0_2, "%", 1, true) ~= nil then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_1, l_0_0) then
  return mp.CLEAN
else
  MpCommon.AppendPersistContext(l_0_2, l_0_0, 0)
  return mp.INFECTED
end
return mp.CLEAN
