-- Threat: !InfrastructureShared
-- Name: 15b367ce050a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_1)
end
sms_untrusted_process()
add_parents()
return mp.INFECTED
