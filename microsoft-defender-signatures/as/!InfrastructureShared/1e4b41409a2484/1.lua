-- Threat: !InfrastructureShared
-- Name: 1e4b41409a2484
-- Type: 21

local l_0_0 = {
  useragent = nri.GetHttpRequestHeader("User-Agent")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
