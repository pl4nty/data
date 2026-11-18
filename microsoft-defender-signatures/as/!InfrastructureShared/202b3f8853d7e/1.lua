-- Threat: !InfrastructureShared
-- Name: 202b3f8853d7e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath() or "NO_IMG_PATH"
local l_0_2 = l_0_0.ppid
local l_0_3 = l_0_0.cmd_line or "NO_CMD_LINE"
local l_0_4 = MpCommon.Base64Encode(l_0_1 .. "|" .. l_0_3) .. ";" .. l_0_2
local l_0_5 = "RemoteInvocation:WINRS|" .. MpCommon.Base64Encode(l_0_1)
local l_0_6 = reportSessionInformationInclusive()
AppendToRollingQueue(l_0_5, l_0_2, safeJsonSerialize(l_0_6), 3600, 100, 1)
recursiveTriggerSig("RemoteInvocation:WINRS", l_0_4, l_0_2, 0)
reportRelevantUntrustedEntities()
reportTimingData()
return mp.INFECTED
