-- Threat: !InfrastructureShared
-- Name: 143782ff73a59
-- Type: 21

if hstrlog[5].matched or hstrlog[6].matched then
  return mp.INFECTED
end
return mp.CLEAN
