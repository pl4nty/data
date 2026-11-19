-- Threat: !InfrastructureShared
-- Name: 1ba7876ee31c7
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched
local l_0_1 = hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched
local l_0_2 = hstrlog[10].matched
local l_0_3 = hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched
local l_0_4 = hstrlog[22].matched
local l_0_5 = hstrlog[23].matched
local l_0_6 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0) + (l_0_4 and 1 or 0) + (l_0_5 and 1 or 0)
if 3 <= l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
