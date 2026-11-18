-- Threat: !InfrastructureShared
-- Name: 35d41be556c78
-- Type: 21

nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY)
return mp.INFECTED
