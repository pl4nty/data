-- Threat: !InfrastructureShared
-- Name: 39415255b846
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "github.com/notepad-plus-plus", 1, true) then
    return mp.CLEAN
  end
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
end
return mp.INFECTED
