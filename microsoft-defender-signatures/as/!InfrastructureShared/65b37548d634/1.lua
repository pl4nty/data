-- Threat: !InfrastructureShared
-- Name: 65b37548d634
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 ~= nil then
  sms_untrusted_process()
  bm_AddRelatedFileFromCommandLine(l_0_1)
end
return mp.INFECTED
