-- Threat: !InfrastructureShared
-- Name: 769785200fac0
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched
local l_0_1 = hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched or hstrlog[23].matched or hstrlog[24].matched
local l_0_2 = hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched
local l_0_3 = hstrlog[28].matched or hstrlog[29].matched or hstrlog[30].matched or hstrlog[31].matched or hstrlog[32].matched or hstrlog[33].matched or hstrlog[34].matched or hstrlog[35].matched or hstrlog[36].matched
local l_0_4 = hstrlog[37].matched or hstrlog[38].matched or hstrlog[39].matched or hstrlog[40].matched or hstrlog[41].matched or hstrlog[42].matched or hstrlog[43].matched or hstrlog[44].matched or hstrlog[45].matched or hstrlog[46].matched or hstrlog[47].matched or hstrlog[48].matched or hstrlog[49].matched or hstrlog[50].matched or hstrlog[51].matched or hstrlog[52].matched or hstrlog[53].matched or hstrlog[54].matched
local l_0_5 = hstrlog[55].matched or hstrlog[56].matched or hstrlog[57].matched
local l_0_6 = hstrlog[58].matched or hstrlog[59].matched or hstrlog[60].matched or hstrlog[61].matched or hstrlog[62].matched or hstrlog[63].matched or hstrlog[64].matched or hstrlog[65].matched
local l_0_7 = hstrlog[66].matched or hstrlog[67].matched
local l_0_8 = hstrlog[68].matched or hstrlog[69].matched
local l_0_9 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0) + (l_0_4 and 1 or 0) + (l_0_5 and 1 or 0) + (l_0_6 and 1 or 0) + (l_0_7 and 1 or 0) + (l_0_8 and 1 or 0)
if 3 <= l_0_9 then
  return mp.INFECTED
end
return mp.CLEAN
