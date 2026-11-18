-- Threat: !InfrastructureShared
-- Name: c7417d4038ff
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = {}
local l_0_1 = nri.GetRawRequestBlob()
l_0_1 = l_0_1 or nri.GetRawResponseBlob()
if not l_0_1 then
  return mp.CLEAN
end
l_0_0.NRI_ResponseBlob = tohex(l_0_1)
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
