-- Threat: !InfrastructureShared
-- Name: 3178c90dfb5e
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
