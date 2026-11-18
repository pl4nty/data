-- Threat: !InfrastructureShared
-- Name: 40a78e318f663
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched
local l_0_1 = hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched
local l_0_2 = hstrlog[23].matched or hstrlog[24].matched or hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched or hstrlog[29].matched or hstrlog[30].matched or hstrlog[31].matched
local l_0_3 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0)
if 2 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
