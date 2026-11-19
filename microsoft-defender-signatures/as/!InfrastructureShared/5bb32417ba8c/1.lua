-- Threat: !InfrastructureShared
-- Name: 5bb32417ba8c
-- Type: 21
-- Includes: BMLuaLib

sms_untrusted_process()
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 and reportGenericRansomware(this_sigattrlog[2].utf8p2, true) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
