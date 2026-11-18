-- Threat: !InfrastructureShared
-- Name: 149b3ba77c230
-- Type: 21

local l_0_0
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  if sigattr_head[l_0_1].matched and (sigattr_head[l_0_1].attribute == 16384 or sigattr_head[l_0_1].attribute == 16385) then
    l_0_0 = mp.ContextualExpandEnvironmentVariables(sigattr_head[l_0_1].utf8p1)
    if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
      mp.ReportLowfi(l_0_0 .. "\000", 3307547556)
    end
  end
end
return mp.INFECTED
