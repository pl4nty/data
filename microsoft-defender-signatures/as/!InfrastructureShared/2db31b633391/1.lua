-- Threat: !InfrastructureShared
-- Name: 2db31b633391
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = ""
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
extractRansomNote(l_0_0)
sms_untrusted_process()
return mp.INFECTED
