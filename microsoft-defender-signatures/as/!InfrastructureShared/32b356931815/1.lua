-- Threat: !InfrastructureShared
-- Name: 32b356931815
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[1]
if l_0_0 == nil or not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
if l_0_1 == nil then
  return mp.CLEAN
end
extractRansomNote(l_0_1)
sms_untrusted_process()
return mp.INFECTED
