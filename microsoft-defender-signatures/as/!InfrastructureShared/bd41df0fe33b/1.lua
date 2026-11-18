-- Threat: !InfrastructureShared
-- Name: bd41df0fe33b
-- Type: 21

local l_0_0 = {
  server = nri.GetHttpRequestHeader("Server"),
  accept = nri.GetHttpRequestHeader("Accept"),
  ["accept-encoding"] = nri.GetHttpRequestHeader("Accept-Encoding"),
  connection = nri.GetHttpRequestHeader("Connection")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
