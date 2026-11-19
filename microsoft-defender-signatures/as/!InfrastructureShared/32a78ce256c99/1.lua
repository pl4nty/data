-- Threat: !InfrastructureShared
-- Name: 32a78ce256c99
-- Type: 21

if not peattributes.ismsil then
  mp.set_mpattribute("HSTR:Adware:Win32/Hotbar")
end
local l_0_0 = hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched
local l_0_1 = hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched
local l_0_2 = hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched
local l_0_3 = hstrlog[23].matched or hstrlog[24].matched or hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched or hstrlog[28].matched
local l_0_4 = (l_0_0 and 1 or 0) + (l_0_1 and 1 or 0) + (l_0_2 and 1 or 0) + (l_0_3 and 1 or 0)
if 3 <= l_0_4 and 6 <= mp.HSTR_WEIGHT then
  return mp.INFECTED
end
return mp.CLEAN
