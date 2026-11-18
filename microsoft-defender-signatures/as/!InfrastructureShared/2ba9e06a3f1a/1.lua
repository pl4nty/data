-- Threat: !InfrastructureShared
-- Name: 2ba9e06a3f1a
-- Type: 21

nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
