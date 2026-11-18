-- Threat: !InfrastructureShared
-- Name: dd413d5658ab
-- Type: 21

nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
