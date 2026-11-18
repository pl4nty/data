-- Threat: !InfrastructureShared
-- Name: 4167834282037
-- Type: 21
-- Flags: 1

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched
local l_0_1 = hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched or hstrlog[23].matched or hstrlog[24].matched or hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched or hstrlog[28].matched
local l_0_2 = 0
if l_0_0 then
  l_0_2 = l_0_2 + 2
end
if l_0_1 then
  l_0_2 = l_0_2 + 1
end
if 3 <= l_0_2 then
  return mp.INFECTED
end
if 2 <= l_0_2 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
