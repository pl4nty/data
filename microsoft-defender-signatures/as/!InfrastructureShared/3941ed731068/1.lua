-- Threat: !InfrastructureShared
-- Name: 3941ed731068
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = nri.GetURI()
local l_0_1 = l_0_0:match("http[s]?://(%d+%.%d+%.%d+%.%d+)")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if isPublicIP(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
