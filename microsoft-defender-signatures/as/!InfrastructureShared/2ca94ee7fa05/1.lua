-- Threat: !InfrastructureShared
-- Name: 2ca94ee7fa05
-- Type: 21

nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), mp.bitor(nri.Telemetry_QUERY, nri.Telemetry_REFERER)))
return mp.INFECTED
