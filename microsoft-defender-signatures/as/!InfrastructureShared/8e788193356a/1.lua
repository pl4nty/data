-- Threat: !InfrastructureShared
-- Name: 8e788193356a
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched) and (hstrlog[5].matched or hstrlog[6].matched) then
  return mp.INFECTED
end
return mp.CLEAN
