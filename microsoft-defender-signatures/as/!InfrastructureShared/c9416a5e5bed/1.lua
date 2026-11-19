-- Threat: !InfrastructureShared
-- Name: c9416a5e5bed
-- Type: 21

nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY)
return mp.INFECTED
