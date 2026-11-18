-- Threat: !InfrastructureShared
-- Name: 41b3bc5cb4aa
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  bm_AddRelatedFileFromCommandLine(l_0_0)
end
sms_untrusted_process()
add_parents()
return mp.INFECTED
