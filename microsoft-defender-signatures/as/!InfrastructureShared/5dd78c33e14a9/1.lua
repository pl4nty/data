-- Threat: !InfrastructureShared
-- Name: 5dd78c33e14a9
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[16].matched and hstrlog[17].matched and hstrlog[18].matched and hstrlog[19].matched and hstrlog[20].matched and hstrlog[21].matched and hstrlog[22].matched or hstrlog[23].matched and hstrlog[24].matched and hstrlog[25].matched and hstrlog[26].matched and hstrlog[27].matched and hstrlog[28].matched and hstrlog[29].matched and hstrlog[30].matched and hstrlog[31].matched and hstrlog[32].matched and (hstrlog[2].matched or hstrlog[3].matched) or hstrlog[33].matched and hstrlog[34].matched and hstrlog[35].matched and hstrlog[36].matched and hstrlog[37].matched and hstrlog[38].matched and hstrlog[39].matched and (hstrlog[2].matched or hstrlog[3].matched) or hstrlog[4].matched and hstrlog[5].matched and hstrlog[6].matched and hstrlog[7].matched and hstrlog[8].matched and hstrlog[9].matched and (hstrlog[14].matched or hstrlog[15].matched) or hstrlog[10].matched and hstrlog[11].matched and hstrlog[12].matched and hstrlog[13].matched and (hstrlog[14].matched or hstrlog[15].matched) then
  return mp.INFECTED
end
return mp.CLEAN
