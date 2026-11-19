-- Threat: !InfrastructureShared
-- Name: 195b387e040e7
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  bm_AddRelatedFileFromCommandLine(l_0_0)
end
addDisruptionInfo(true)
sms_untrusted_process()
add_parents()
return mp.INFECTED
