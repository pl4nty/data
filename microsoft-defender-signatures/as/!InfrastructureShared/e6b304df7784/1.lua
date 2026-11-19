-- Threat: !InfrastructureShared
-- Name: e6b304df7784
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = "PyArmorRQ"
local l_0_1 = this_sigattrlog[1].utf8p1
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
if not isnull(l_0_2) then
  return mp.CLEAN
end
AppendToRollingQueue(l_0_0, l_0_1, 1, 604800)
local l_0_3 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_3.ppid, "l+")
bm.add_action("SmsAsyncScanEvent", 2000)
return mp.INFECTED
