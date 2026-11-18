-- Threat: !InfrastructureShared
-- Name: 757789f9e1ecf
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched
local l_0_1 = hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched
local l_0_2 = hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched
local l_0_3 = hstrlog[23].matched or hstrlog[24].matched or hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched or hstrlog[28].matched or hstrlog[29].matched or hstrlog[30].matched or hstrlog[31].matched or hstrlog[32].matched or hstrlog[33].matched or hstrlog[34].matched or hstrlog[35].matched or hstrlog[36].matched or hstrlog[37].matched or hstrlog[38].matched or hstrlog[39].matched or hstrlog[40].matched or hstrlog[41].matched or hstrlog[42].matched or hstrlog[43].matched or hstrlog[44].matched or hstrlog[45].matched or hstrlog[46].matched or hstrlog[47].matched or hstrlog[48].matched
local l_0_4 = hstrlog[49].matched or hstrlog[50].matched or hstrlog[51].matched or hstrlog[52].matched or hstrlog[53].matched or hstrlog[54].matched or hstrlog[55].matched or hstrlog[56].matched or hstrlog[57].matched or hstrlog[58].matched or hstrlog[59].matched
local l_0_5 = hstrlog[60].matched or hstrlog[61].matched or hstrlog[62].matched or hstrlog[63].matched
local l_0_6 = (l_0_0 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0) + (l_0_4 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_5 and 1 or 0)
if l_0_3 and 3 <= l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
