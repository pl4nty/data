-- Threat: !InfrastructureShared
-- Name: 5f41f6c951b2
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = 300
  if l_0_1 <= #l_0_0 then
    nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
    return mp.INFECTED
  end
end
return mp.CLEAN
