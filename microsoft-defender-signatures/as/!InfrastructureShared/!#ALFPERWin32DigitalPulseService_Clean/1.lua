-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Win32/DigitalPulseService_Clean
-- Type: 10
-- MpAttributes: CERT:Clean:DigitalPulse & HSTR:GolangBinary & !PUA:Exception

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if string.sub(l_0_2, 1, 9) == "dpservice" then
  return mp.INFECTED
end
return mp.CLEAN
