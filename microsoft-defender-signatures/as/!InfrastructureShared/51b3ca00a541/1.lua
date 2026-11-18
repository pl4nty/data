-- Threat: !InfrastructureShared
-- Name: 51b3ca00a541
-- Type: 21

for l_0_0 = mp.SIGATTR_LOG_SZ, 1, -1 do
  if sigattr_head[l_0_0].matched and sigattr_head[l_0_0].attribute == 16384 then
    local l_0_1 = mp.ContextualExpandEnvironmentVariables(sigattr_head[l_0_0].utf8p1)
    if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
      mp.ReportLowfi(l_0_1, 1501004956)
    end
  end
end
return mp.INFECTED
