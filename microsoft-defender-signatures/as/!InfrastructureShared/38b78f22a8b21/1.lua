-- Threat: !InfrastructureShared
-- Name: 38b78f22a8b21
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched or hstrlog[14].matched or hstrlog[15].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched or hstrlog[20].matched or hstrlog[21].matched or hstrlog[22].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
