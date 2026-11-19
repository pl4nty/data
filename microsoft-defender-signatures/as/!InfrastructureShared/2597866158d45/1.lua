-- Threat: !InfrastructureShared
-- Name: 2597866158d45
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched or hstrlog[13].matched) and (hstrlog[14].matched or hstrlog[15].matched or hstrlog[16].matched or hstrlog[17].matched or hstrlog[18].matched or hstrlog[19].matched) then
  return mp.INFECTED
end
return mp.LOWFI
