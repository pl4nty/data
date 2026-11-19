-- Threat: !InfrastructureShared
-- Name: 2db3479f4861
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched or not this_sigattrlog[2].ppid then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[2].utf8p2 or ""
local l_0_2 = bm.get_imagepath() or "NO_IMG_PATH"
local l_0_3 = l_0_0.ppid
local l_0_4 = l_0_0.cmd_line or "NO_CMD_LINE"
local l_0_5 = MpCommon.Base64Encode(l_0_2 .. "|" .. l_0_4) .. ";" .. l_0_1 .. ";" .. l_0_3
local l_0_6 = "RemoteInvocation:DCOM.MMC20|" .. MpCommon.Base64Encode(l_0_2)
local l_0_7 = reportSessionInformationInclusive()
AppendToRollingQueue(l_0_6, l_0_3, safeJsonSerialize(l_0_7), 3600, 100, 1)
recursiveTriggerSig("RemoteInvocation:DCOM.MMC20", l_0_5, l_0_3, 0)
reportRelevantUntrustedEntities()
reportTimingData()
return mp.INFECTED
