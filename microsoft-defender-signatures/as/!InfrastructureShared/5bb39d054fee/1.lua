-- Threat: !InfrastructureShared
-- Name: 5bb39d054fee
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = {
  "OFFICE",
  "EMAILCLIENT",
  "WMI"
}
local l_0_1 = {min = 1, max = 5}
if QueryProcContext(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
