-- Threat: !InfrastructureShared
-- Name: 61416210a257
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = {}
local l_0_1 = nri.GetRawRequestBlob()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {"pg_sleep"}
if contains(l_0_2, l_0_3) then
  l_0_0.NRI_RequestBlob = tohex(l_0_2)
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
