-- Threat: !InfrastructureShared
-- Name: 52a9c4f062a7
-- Type: 21

nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
