-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b3a76c631e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 and next(l_0_0) then
  (bm.add_related_string)("[->] MEDICATED COMMAND LINE: ", l_0_0.command_line, bm.RelatedStringBMReport)
  pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.MK!sms")
end
return mp.INFECTED

