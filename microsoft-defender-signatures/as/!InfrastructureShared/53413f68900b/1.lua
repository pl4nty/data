-- Threat: !InfrastructureShared
-- Name: 53413f68900b
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = {}
local l_0_1 = nri.GetRawRequestBlob()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {"cookie:"}
if contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
l_0_0.NRI_RequestBlob = tohex(l_0_2)
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
