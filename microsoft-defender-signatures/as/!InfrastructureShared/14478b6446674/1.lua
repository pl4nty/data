-- Threat: !InfrastructureShared
-- Name: 14478b6446674
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched
local l_0_2 = hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched
local l_0_3 = hstrlog[15].matched
local l_0_4 = 0
if l_0_0 then
  l_0_4 = l_0_4 + 1
end
if l_0_1 then
  l_0_4 = l_0_4 + 1
end
if l_0_2 then
  l_0_4 = l_0_4 + 1
end
if l_0_3 then
  l_0_4 = l_0_4 + 1
end
if 2 <= l_0_4 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
