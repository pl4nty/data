-- Threat: !InfrastructureShared
-- Name: 55402035e082
-- Type: 21

local l_0_0 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  referer = nri.GetHttpRequestHeader("referer")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
