-- Threat: !InfrastructureShared
-- Name: f541a751a4b7
-- Type: 21

if nri.GetHttpCommand() ~= nri.HTTP_POST then
  return mp.CLEAN
end
local l_0_0 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  ["accept-encoding"] = nri.GetHttpRequestHeader("Accept-Encoding"),
  host = nri.GetHttpRequestHeader("Host")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
