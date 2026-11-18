-- Threat: !InfrastructureShared
-- Name: 83b3cd3a0744
-- Type: 21

local l_0_0, l_0_1
for l_0_2 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_2].matched then
    if sigattr_head[l_0_2].attribute == 16384 or sigattr_head[l_0_2].attribute == 16385 then
      l_0_1 = string.lower(sigattr_head[l_0_2].utf8p1)
    elseif sigattr_head[l_0_2].attribute == 16393 then
      l_0_0 = string.lower(sigattr_head[l_0_2].utf8p2)
    end
    if l_0_1 and l_0_0 and string.find(l_0_0, l_0_1) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
