-- Threat: !InfrastructureShared
-- Name: 66b325c5ce4b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTacticObservedGlobal("credentialdumping_concrete") then
  local l_0_0 = bm.get_current_process_startup_info()
  local l_0_1 = l_0_0.command_line
  if l_0_1 ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_1)
  end
  sms_untrusted_process()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
