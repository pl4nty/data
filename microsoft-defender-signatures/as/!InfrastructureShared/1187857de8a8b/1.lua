-- Threat: !InfrastructureShared
-- Name: 1187857de8a8b
-- Type: 21

if hstrlog[10].matched or hstrlog[9].matched then
  return mp.INFECTED
end
return mp.CLEAN
