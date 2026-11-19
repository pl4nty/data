-- Threat: !InfrastructureShared
-- Name: 69b3d1a74a39
-- Type: 21

local l_0_0 = this_sigattrlog[3]
if not (l_0_0 and l_0_0.utf8p2) or not l_0_0.utf8p1 then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0.utf8p2, ";vmregionsize:(%d+)")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = tonumber(l_0_1)
if 200000 < l_0_2 or l_0_2 < 100000 then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_0.utf8p2, ";vmbaseaddress:(%d+)")
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = string.match(l_0_0.utf8p1, "targetprocessppid:(%d+):(%d+)")
if not l_0_4 or not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = string.format("pid:%s,ProcessStart:%s,address:%s,size:0", l_0_4, l_0_5, l_0_3)
mp.TriggerScanResource("ems", l_0_6)
return mp.INFECTED
