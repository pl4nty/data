-- Threat: !InfrastructureShared
-- Name: 97241be7e7aeb
-- Type: 21
-- Includes: BMLuaLib

reportHeaders({"Host", "User-Agent"})
local l_0_0 = nri.GetRawResponseBlob()
if string.byte(l_0_0, 1) == 252 and (string.byte(l_0_0, 2) == 232 or string.byte(l_0_0, 2) == 72) then
  return mp.INFECTED
end
return mp.CLEAN
