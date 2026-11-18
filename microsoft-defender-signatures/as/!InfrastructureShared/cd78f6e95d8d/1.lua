-- Threat: !InfrastructureShared
-- Name: cd78f6e95d8d
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched or hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched or hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
