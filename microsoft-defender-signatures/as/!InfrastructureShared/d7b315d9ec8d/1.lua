-- Threat: !InfrastructureShared
-- Name: d7b315d9ec8d
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("GODOT-PCK")
if l_0_0 then
  local l_0_1 = bm.get_current_process_startup_info()
  if isnull(l_0_1) then
    return mp.INFECTED
  end
  bm.add_related_string("[i] MALICIOUS COMMANDLINE: ", l_0_1.command_line, bm.RelatedStringBMReport)
  add_parents()
end
return mp.INFECTED
