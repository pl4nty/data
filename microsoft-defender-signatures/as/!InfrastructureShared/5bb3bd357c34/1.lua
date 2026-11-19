-- Threat: !InfrastructureShared
-- Name: 5bb3bd357c34
-- Type: 21
-- Includes: BMLuaLib

sms_untrusted_process()
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  bm.add_related_string("EncryptorCommandLine", tostring(l_0_0.command_line), bm.RelatedStringBMReport)
end
return mp.INFECTED
