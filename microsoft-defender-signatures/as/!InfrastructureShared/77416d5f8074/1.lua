-- Threat: !InfrastructureShared
-- Name: 77416d5f8074
-- Type: 21

nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
