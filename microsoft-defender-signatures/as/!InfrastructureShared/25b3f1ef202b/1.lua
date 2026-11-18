-- Threat: !InfrastructureShared
-- Name: 25b3f1ef202b
-- Type: 21

local l_0_0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 16384 and l_0_0 == nil and sigattr_head[l_0_1].wp1 ~= nil then
    mp.ReportLowfi(sigattr_head[l_0_1].utf8p1, 2175865982)
    return mp.INFECTED
  end
end
return mp.INFECTED
