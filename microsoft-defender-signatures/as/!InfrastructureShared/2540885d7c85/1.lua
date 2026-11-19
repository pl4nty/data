-- Threat: !InfrastructureShared
-- Name: 2540885d7c85
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = nri.GetHttpRequestHeader("User-Agent")
if l_0_0 == nil then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), {useragent = l_0_0})
return mp.INFECTED
