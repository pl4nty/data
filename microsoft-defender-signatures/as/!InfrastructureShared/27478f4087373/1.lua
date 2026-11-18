-- Threat: !InfrastructureShared
-- Name: 27478f4087373
-- Type: 21

mp.set_mpattribute("HSTR:Adware:Win32/Lollipop")
local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched
local l_0_2 = hstrlog[9].matched or hstrlog[10].matched
local l_0_3 = hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched
local l_0_4 = hstrlog[16].matched
local l_0_5 = hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched
local l_0_6 = hstrlog[21].matched
local l_0_7 = hstrlog[22].matched
local l_0_8 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0) + (l_0_4 and 1 or 0) + (l_0_5 and 1 or 0) + (l_0_6 and 1 or 0) + (l_0_7 and 1 or 0)
if 3 <= l_0_8 then
  return mp.INFECTED
end
return mp.CLEAN
