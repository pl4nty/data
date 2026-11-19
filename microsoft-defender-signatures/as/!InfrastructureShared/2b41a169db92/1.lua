-- Threat: !InfrastructureShared
-- Name: 2b41a169db92
-- Type: 21

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].p1
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0):gsub("%.$", "")
if not string.match(l_0_0, "^artxdiag%d+artx%.[a-z0-9%-]+%.dnslog%.cn$") then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "diagnostic-dns-callback"
})
return mp.INFECTED
