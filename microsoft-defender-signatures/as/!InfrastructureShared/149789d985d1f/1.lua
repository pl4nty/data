-- Threat: !InfrastructureShared
-- Name: 149789d985d1f
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched) and (hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[7].matched or hstrlog[8].matched) then
  return mp.INFECTED
end
return mp.CLEAN
