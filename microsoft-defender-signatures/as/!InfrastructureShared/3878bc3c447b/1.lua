-- Threat: !InfrastructureShared
-- Name: 3878bc3c447b
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
