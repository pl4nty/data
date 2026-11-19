-- Threat: !InfrastructureShared
-- Name: adb32f7c7750
-- Type: 21
-- Includes: BMLuaLib

sms_untrusted_process()
local l_0_0 = mp.CLEAN
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2, true)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[4].utf8p2, true)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
