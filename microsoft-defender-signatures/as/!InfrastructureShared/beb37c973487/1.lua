-- Threat: !InfrastructureShared
-- Name: beb37c973487
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
else
  return mp.CLEAN
end
if isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0.utf8p1, "targetprocessppid:(%d+)")
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.GetPPidFromPid(l_0_1)
if isnull(l_0_2) then
  return mp.CLEAN
end
bm.request_SMS(l_0_2, "m")
bm.add_action("SmsAsyncScanEvent", 1)
return mp.INFECTED
