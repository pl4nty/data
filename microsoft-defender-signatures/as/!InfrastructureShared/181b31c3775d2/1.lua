-- Threat: !InfrastructureShared
-- Name: 181b31c3775d2
-- Type: 21

local l_0_0 = this_sigattrlog[9]
if not l_0_0 or not l_0_0.utf8p1 then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[8]
if not l_0_1 or not l_0_1.utf8p2 then
  return mp.CLEAN
end
local l_0_2 = tonumber(l_0_0.utf8p1)
if l_0_2 < 9000 or 50000 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_1.utf8p2, "(%d+);regionsize:")
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.format("%s,address:%s,size:0", l_0_0.ppid, l_0_3)
mp.TriggerScanResource("ems", l_0_4)
return mp.INFECTED
