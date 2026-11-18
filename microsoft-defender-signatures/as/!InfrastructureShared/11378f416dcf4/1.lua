-- Threat: !InfrastructureShared
-- Name: 11378f416dcf4
-- Type: 21

if hstrlog[6].matched or hstrlog[3].matched and hstrlog[7].matched then
  return mp.INFECTED
end
return mp.CLEAN
