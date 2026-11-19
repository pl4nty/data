-- Threat: !InfrastructureShared
-- Name: 25178a5e90e53
-- Type: 21

local l_0_0 = hstrlog[1].matched or hstrlog[2].matched
local l_0_1 = hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched
local l_0_2 = hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched
local l_0_3 = hstrlog[23].matched or hstrlog[24].matched or hstrlog[25].matched or hstrlog[26].matched or hstrlog[27].matched or hstrlog[28].matched or hstrlog[29].matched or hstrlog[30].matched or hstrlog[31].matched
local l_0_5 = peattributes.hasexports and pesecs[1].SizeOfRawData >= 135168 and pesecs[1].SizeOfRawData <= 167936 and pesecs[3].VirtualAddress > 139264 and pesecs[3].VirtualAddress <= 204800 and pesecs[3].SizeOfRawData >= 29952 and pesecs[3].SizeOfRawData <= 103680
if l_0_0 and l_0_1 and l_0_2 and l_0_3 and l_0_5 then
  mp.changedetectionname(186)
  return mp.INFECTED
end
if l_0_0 and l_0_1 and l_0_2 and l_0_3 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
