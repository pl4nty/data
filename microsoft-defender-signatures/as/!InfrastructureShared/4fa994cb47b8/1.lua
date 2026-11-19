-- Threat: !InfrastructureShared
-- Name: 4fa994cb47b8
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
