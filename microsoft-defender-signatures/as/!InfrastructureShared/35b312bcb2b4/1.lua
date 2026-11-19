-- Threat: !InfrastructureShared
-- Name: 35b312bcb2b4
-- Type: 21

local l_0_0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 16401 then
    l_0_0 = string.lower(sigattr_head[l_0_1].utf8p1)
    if string.find(l_0_0, "\\program files", 1, true) then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
