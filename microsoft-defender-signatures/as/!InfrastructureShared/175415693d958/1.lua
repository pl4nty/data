-- Threat: !InfrastructureShared
-- Name: 175415693d958
-- Type: 21

local l_0_0 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  cookie = nri.GetHttpRequestHeader("Cookie")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
