-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\142b388434af5\1.luac 

-- params : ...
-- function num : 0
if IsTacticObservedGlobal("credentialdumping_concrete") then
  local l_0_0 = (bm.get_current_process_startup_info)()
  local l_0_1 = l_0_0.command_line
  if l_0_1 ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_1)
  end
  local l_0_2, l_0_3 = pcall(reportBmInfo)
  if not l_0_2 and l_0_3 then
    (bm.add_related_string)("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
  end
  sms_untrusted_process()
  add_parents()
  return mp.INFECTED
end
do
  return mp.CLEAN
end

