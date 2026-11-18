-- Threat: !InfrastructureShared
-- Name: 1e278033f1aa7
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
if hstrlog[2].matched then
  l_0_1 = l_0_1 + 1
end
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
local l_0_2 = 0
if hstrlog[1].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[2].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[3].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[4].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[5].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[6].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[7].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[8].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[9].matched then
  l_0_2 = l_0_2 + 1
end
if mp.getfilesize() < 3000000 and (1 <= l_0_0 and 1 <= l_0_1 or 3 <= l_0_2) or 5 <= l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
