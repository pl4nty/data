-- Threat: !InfrastructureShared
-- Name: ef78cf9ac4a5
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
