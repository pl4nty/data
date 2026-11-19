-- Threat: !InfrastructureShared
-- Name: 8c61109bd7ac
-- Type: 21

if hstrlog[6].matched or hstrlog[7].matched then
  return mp.INFECTED
end
return mp.CLEAN
