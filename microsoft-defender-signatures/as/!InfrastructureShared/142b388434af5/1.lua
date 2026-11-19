-- Threat: !InfrastructureShared
-- Name: 142b388434af5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTacticObservedGlobal("credentialdumping_concrete") then
  local l_0_0 = bm.get_current_process_startup_info()
  local l_0_1 = l_0_0.command_line
  if l_0_1 ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_1)
  end
  local l_0_2, l_0_3 = pcall(reportBmInfo)
  if not l_0_2 and l_0_3 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
  end
  sms_untrusted_process()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
