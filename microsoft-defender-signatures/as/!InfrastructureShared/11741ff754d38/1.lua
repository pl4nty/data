-- Threat: !InfrastructureShared
-- Name: 11741ff754d38
-- Type: 21

local l_0_0 = {
  referer = nri.GetHttpRequestHeader("referer")
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
return mp.INFECTED
