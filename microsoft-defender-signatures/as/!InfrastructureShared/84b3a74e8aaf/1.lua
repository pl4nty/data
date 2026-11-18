-- Threat: !InfrastructureShared
-- Name: 84b3a74e8aaf
-- Type: 21
-- Includes: BMLuaLib

sms_untrusted_process()
local l_0_0 = mp.CLEAN
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[1].utf8p2, true)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2, true)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
