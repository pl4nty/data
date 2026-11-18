-- Threat: !InfrastructureShared
-- Name: ad612509fe2c
-- Type: 21

if hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched then
  return mp.INFECTED
end
return mp.CLEAN
