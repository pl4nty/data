-- Threat: !InfrastructureShared
-- Name: 95b3e61b36df
-- Type: 21

local l_0_0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_1].matched and sigattr_tail[l_0_1].attribute == 16401 then
    l_0_0 = sigattr_tail[l_0_1].utf8p1
    if l_0_0 ~= nil then
      l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
      l_0_0 = string.lower(l_0_0)
      if l_0_0 ~= nil and string.find(l_0_0, "\\microsoft office", 1, true) == nil and string.find(l_0_0, "\\windowsapps\\microsoft.office.desktop", 1, true) == nil then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
