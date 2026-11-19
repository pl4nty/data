-- Threat: !InfrastructureShared
-- Name: 20078b6519c67
-- Type: 21

if hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched and hstrlog[10].matched then
  return mp.INFECTED
end
return mp.CLEAN
