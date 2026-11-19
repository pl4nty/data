-- Threat: !InfrastructureShared
-- Name: 12f78cab4f252
-- Type: 21

if hstrlog[4].matched and hstrlog[5].matched then
  return mp.INFECTED
end
return mp.CLEAN
