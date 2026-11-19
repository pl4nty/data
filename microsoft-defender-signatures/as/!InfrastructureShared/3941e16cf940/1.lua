-- Threat: !InfrastructureShared
-- Name: 3941e16cf940
-- Type: 21

if not this_sigattrlog[1].matched or this_sigattrlog[1].p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].p1
local l_0_1
if this_sigattrlog[2] and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = false
if string.find(l_0_1, "\\resources\\", 1, true) or string.find(l_0_1, "\\electron", 1, true) then
  l_0_2 = true
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {electron_ja3c = l_0_0, electron_tls_proc = l_0_1}
nri.AddTelemetry(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), l_0_3)
return mp.INFECTED
