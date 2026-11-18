-- Threat: !InfrastructureShared
-- Name: 5d78d8c5ddb4
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[3].matched then
  l_0_1 = l_0_1 + 1
end
if l_0_0 == 2 and 1 <= not l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
