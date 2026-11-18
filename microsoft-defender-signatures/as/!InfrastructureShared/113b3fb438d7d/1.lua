-- Threat: !InfrastructureShared
-- Name: 113b3fb438d7d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 6)
sms_untrusted_process()
local l_0_1 = mp.CLEAN
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_1 = reportGenericRansomware(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 then
  l_0_1 = reportGenericRansomware(this_sigattrlog[5].utf8p2)
end
if l_0_1 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
