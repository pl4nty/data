-- Threat: !InfrastructureShared
-- Name: 2b9415d596174
-- Type: 21
-- Includes: BMLuaLib

nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH))
reportHeaders({
  "Host",
  "User-Agent",
  "Content-Type",
  "Authorization"
})
return mp.INFECTED
