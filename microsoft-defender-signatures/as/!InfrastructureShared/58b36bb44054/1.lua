-- Threat: !InfrastructureShared
-- Name: 58b36bb44054
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

sms_untrusted_process()
reportSessionInformation()
reportTimingData()
if this_sigattrlog[1].matched then
  bm.add_related_string("NamedPipeImpersonation", safeJsonSerialize(this_sigattrlog[1]), bm.RelatedStringBMReport)
end
return mp.INFECTED
