-- Threat: !InfrastructureShared
-- Name: 25b3c5ecf142
-- Type: 21

local l_0_0
for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
  l_0_0 = string.lower(sigattr_head[l_0_1].utf8p1)
  if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 16384 then
    if string.find(l_0_0, ":\\", 1, true) == 2 and string.find(l_0_0, "\\", 4, true) == nil then
      local l_0_2 = string.sub(l_0_0, 0, 1)
      if string.len(l_0_2) == 1 and string.match(l_0_2, "[A-Za-z]") then
        return mp.INFECTED
      end
    elseif string.find(l_0_0, "\\\\", 1, true) == 0 and string.find(l_0_0, "\\", 3, true) == nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
