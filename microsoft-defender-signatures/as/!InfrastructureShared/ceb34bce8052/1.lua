-- Threat: !InfrastructureShared
-- Name: ceb34bce8052
-- Type: 21

local l_0_0 = this_sigattrlog[1]
if not (l_0_0 ~= nil and l_0_0.matched) or l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3 = string.match(l_0_0.utf8p1, "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.format("pid:%d,ProcessStart:%d", l_0_2, l_0_3)
local l_0_5 = mp.GetProcessCommandLine(l_0_4)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5)
if not string.find(l_0_6, "winmgmt", 1, true) then
  return mp.CLEAN
end
local l_0_7 = string.lower(l_0_0.utf8p2)
local l_0_8, l_0_9 = string.match(l_0_7, "(%d+);vmregionsize:(%d+);")
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = tonumber(l_0_9)
if not l_0_10 then
  return mp.CLEAN
end
if l_0_10 <= 4096 then
  return mp.CLEAN
end
bm.add_related_string("ProtectVmInfo", l_0_7, bm.RelatedStringBMReport)
return mp.INFECTED
