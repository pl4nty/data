-- Threat: !InfrastructureShared
-- Name: 11041eeb776ce
-- Type: 21

local l_0_0, l_0_1
if not this_sigattrlog[3].matched or not this_sigattrlog[6].matched then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[3].utf8p2
l_0_1 = this_sigattrlog[6].utf8p2
local l_0_2 = "user-agent"
local l_0_3 = 100
local l_0_4 = 3
local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueCreate, l_0_2, l_0_3, l_0_4, 1)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5, l_0_6 = pcall(MpCommon.RollingQueueAppend, l_0_2, l_0_0, l_0_1, l_0_4)
if not l_0_5 then
  return mp.CLEAN
end
return mp.INFECTED
