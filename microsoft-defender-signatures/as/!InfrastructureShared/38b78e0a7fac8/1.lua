-- Threat: !InfrastructureShared
-- Name: 38b78e0a7fac8
-- Type: 21
-- Flags: 1

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
local l_0_1 = 0
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
local l_0_2 = 0
if hstrlog[8].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[9].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[10].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[11].matched then
  l_0_2 = l_0_2 + 1
end
local l_0_3 = 0
if hstrlog[12].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[13].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[14].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0 == 3 or 3 <= l_0_1 and 2 <= l_0_2 and 2 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
