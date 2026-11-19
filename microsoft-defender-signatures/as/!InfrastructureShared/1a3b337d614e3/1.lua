-- Threat: !InfrastructureShared
-- Name: 1a3b337d614e3
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) then
  return mp.CLEAN
end
bm.request_SMS(l_0_0.ppid, "h+")
bm.add_action("SmsAsyncScanEvent", 10000)
AppendToRollingQueue("PowershellAMSIpatch", "Amsi", "1", 86400)
return mp.CLEAN
