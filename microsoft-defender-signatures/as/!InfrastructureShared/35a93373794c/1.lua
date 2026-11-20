-- Threat: !InfrastructureShared
-- Name: 35a93373794c
-- Type: 21

nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
