-- Threat: !InfrastructureShared
-- Name: 35b3a76c631e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) then
  bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_0.command_line, bm.RelatedStringBMReport)
  pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.MK!sms")
end
return mp.INFECTED
