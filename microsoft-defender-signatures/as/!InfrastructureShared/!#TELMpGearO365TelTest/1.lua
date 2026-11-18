-- Threat: !InfrastructureShared
-- Name: !#TEL:MpGearO365TelTest
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.sub(l_0_0, 1, 3) == "4c1" then
  return mp.INFECTED
end
return mp.CLEAN
