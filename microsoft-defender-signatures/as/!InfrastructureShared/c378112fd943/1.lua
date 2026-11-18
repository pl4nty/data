-- Threat: !InfrastructureShared
-- Name: c378112fd943
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
if mp.getfilesize() < 200000 and l_0_0 == 2 and 1 <= l_0_1 or l_0_2 == 5 then
  return mp.INFECTED
end
return mp.CLEAN
