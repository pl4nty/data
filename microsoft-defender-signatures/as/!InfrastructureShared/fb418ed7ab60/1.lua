-- Threat: !InfrastructureShared
-- Name: fb418ed7ab60
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if not string.find(l_0_1, "operator.admin", 1, true) then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
