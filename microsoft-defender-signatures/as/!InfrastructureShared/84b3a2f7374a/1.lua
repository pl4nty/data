-- Threat: !InfrastructureShared
-- Name: 84b3a2f7374a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2)
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_1 = this_sigattrlog[1].utf8p1
  extractRansomNote(l_0_1)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  sms_untrusted_process()
  return mp.INFECTED
end
return mp.CLEAN
