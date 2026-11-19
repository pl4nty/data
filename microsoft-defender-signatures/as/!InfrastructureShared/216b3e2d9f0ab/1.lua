-- Threat: !InfrastructureShared
-- Name: 216b3e2d9f0ab
-- Type: 21

local l_0_0 = this_sigattrlog[9]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2, l_0_3 = string.match(l_0_1, "targetprocessppid:(%d+):(%d+)")
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.format("pid:%s,ProcessStart:%s", l_0_2, l_0_3)
bm.request_SMS(l_0_4, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
