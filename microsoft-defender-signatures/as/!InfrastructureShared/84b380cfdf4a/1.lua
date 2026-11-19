-- Threat: !InfrastructureShared
-- Name: 84b380cfdf4a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = MpCommon.RollingQueueCount("TamperingAlerts")
if l_0_0 ~= nil and 2 <= l_0_0 then
  sms_untrusted_process()
  local l_0_1 = mp.CLEAN
  if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
    l_0_1 = reportGenericRansomware(this_sigattrlog[1].utf8p2)
  elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
    l_0_1 = reportGenericRansomware(this_sigattrlog[2].utf8p2)
  end
  if l_0_1 == mp.INFECTED then
    reportTimingData()
    return mp.INFECTED
  end
end
return mp.CLEAN
