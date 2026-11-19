-- Threat: !InfrastructureShared
-- Name: 20a7809ed8280
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
if hstrlog[4].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[5].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[6].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[7].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[8].matched then
  l_0_1 = l_0_1 + 1
end
if 1 <= l_0_0 and 4 <= l_0_1 or 1 <= l_0_0 and l_0_1 == 6 then
  return mp.INFECTED
end
return mp.CLEAN
