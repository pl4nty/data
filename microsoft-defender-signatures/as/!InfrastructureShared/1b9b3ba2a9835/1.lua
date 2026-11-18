-- Threat: !InfrastructureShared
-- Name: 1b9b3ba2a9835
-- Type: 21

local l_0_0, l_0_1, l_0_2
for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_3].matched then
    if sigattr_head[l_0_3].attribute == 16384 and sigattr_head[l_0_3].utf8p1 and l_0_0 == nil then
      l_0_0 = string.lower(sigattr_head[l_0_3].utf8p1)
      l_0_1 = string.match(l_0_0, "\\roaming\\%x%x+\\([^\\]+)$")
    elseif sigattr_head[l_0_3].attribute == 16393 and sigattr_head[l_0_3].utf8p2 and l_0_2 == nil then
      l_0_2 = string.lower(sigattr_head[l_0_3].utf8p2)
      l_0_2 = string.match(l_0_2, "\\roaming\\%x%x+\\([^\\]+)$")
    end
    if l_0_0 ~= nil and l_0_2 ~= nil and l_0_1 == l_0_2 then
      mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(sigattr_head[l_0_3].utf8p1), 3276690080)
      return mp.INFECTED
    end
  end
end
return mp.INFECTED
