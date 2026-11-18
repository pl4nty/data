-- Threat: !InfrastructureShared
-- Name: 32b31fbbdfc7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
extractRansomNote(l_0_0)
sms_untrusted_process()
return mp.INFECTED
