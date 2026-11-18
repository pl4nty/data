-- Threat: !InfrastructureShared
-- Name: 15978ed43f9cb
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
local l_0_1 = 0
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
if hstrlog[12].matched then
  l_0_2 = l_0_2 + 1
end
if l_0_0 == 3 and hstrlog[1].hitcount > 40 or l_0_1 == 3 and 10 < hstrlog[1].hitcount or l_0_2 == 5 then
  return mp.INFECTED
end
return mp.CLEAN
