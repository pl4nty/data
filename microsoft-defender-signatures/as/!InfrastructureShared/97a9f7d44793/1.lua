-- Threat: !InfrastructureShared
-- Name: 97a9f7d44793
-- Type: 21

if nri.GetHttpCommand() ~= nri.HTTP_CONNECT then
  return mp.CLEAN
end
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
return mp.INFECTED
