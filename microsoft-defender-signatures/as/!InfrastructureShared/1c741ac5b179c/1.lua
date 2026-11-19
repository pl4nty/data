-- Threat: !InfrastructureShared
-- Name: 1c741ac5b179c
-- Type: 21

nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "probe-or-verification-marker"
})
return mp.INFECTED
