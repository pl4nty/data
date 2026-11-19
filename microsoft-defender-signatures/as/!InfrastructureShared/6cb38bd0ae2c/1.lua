-- Threat: !InfrastructureShared
-- Name: 6cb38bd0ae2c
-- Type: 21

local l_0_0, l_0_1
for l_0_2 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_2].matched then
    if sigattr_head[l_0_2].attribute == 16384 and l_0_0 == nil then
      l_0_0 = string.lower(sigattr_head[l_0_2].utf8p1)
    elseif sigattr_head[l_0_2].attribute == 16393 and l_0_1 == nil then
      l_0_1 = string.lower(sigattr_head[l_0_2].utf8p2)
      l_0_1 = string.gsub(l_0_1, "\"", "")
    end
    if l_0_0 ~= nil and l_0_1 ~= nil then
      if l_0_0 == l_0_1 then
        mp.ReportLowfi(sigattr_head[l_0_2].utf8p1, 3836302819)
        return mp.INFECTED
      end
      break
    end
  end
end
return mp.CLEAN
