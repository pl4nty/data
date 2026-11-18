-- Threat: !InfrastructureShared
-- Name: 154001e92f3e
-- Type: 21

local l_0_0 = {}
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 28768 then
    local l_0_2 = sigattr_head[l_0_1].utf8p1
    l_0_0.TlsJa3CHash = l_0_2
    nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
  end
end
return mp.INFECTED
