-- Threat: !InfrastructureShared
-- Name: bd7882b641ac
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
