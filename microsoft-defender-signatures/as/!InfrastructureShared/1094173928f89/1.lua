-- Threat: !InfrastructureShared
-- Name: 1094173928f89
-- Type: 21

local l_0_0 = this_sigattrlog[13].utf8p1
local l_0_1 = {
  CustomBlockList = true,
  CasbPolicy = true,
  CustomPolicy = true
}
if l_0_1[l_0_0] then
  return mp.CLEAN
end
local l_0_2 = {SmartScreenDetermination = l_0_0}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_2)
return mp.INFECTED
