-- Threat: !InfrastructureShared
-- Name: adb333a28c90
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[4].utf8p2)
end
local l_0_1 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if l_0_1 ~= "" then
  extractRansomNote(l_0_1)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  sms_untrusted_process()
  return mp.INFECTED
end
return mp.CLEAN
