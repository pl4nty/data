-- Threat: !InfrastructureShared
-- Name: f9785c92505e
-- Type: 21

if (hstrlog[2].matched or hstrlog[3].matched) and (hstrlog[5].matched or hstrlog[6].matched) and hstrlog[1].matched and hstrlog[4].matched then
  return mp.INFECTED
end
return mp.CLEAN
