-- Threat: !InfrastructureShared
-- Name: ea78b4af637c
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[4].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[5].matched then
  l_0_1 = l_0_1 + 1
end
if 1 <= not l_0_0 and 1 <= l_0_1 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
