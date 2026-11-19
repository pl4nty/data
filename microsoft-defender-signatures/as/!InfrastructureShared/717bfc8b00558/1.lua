-- Threat: !InfrastructureShared
-- Name: 717bfc8b00558
-- Type: 21

local l_0_0 = hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched and hstrlog[4].matched and hstrlog[5].matched and hstrlog[6].matched and hstrlog[7].matched
local l_0_1 = hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched and hstrlog[18].matched and hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched or hstrlog[23].matched or hstrlog[24].matched or hstrlog[25].matched and hstrlog[26].matched or hstrlog[27].matched and hstrlog[28].matched or hstrlog[29].matched or hstrlog[30].matched
if l_0_0 and l_0_1 then
  mp.changedetectionname(805306383)
  return mp.INFECTED
end
return mp.CLEAN
