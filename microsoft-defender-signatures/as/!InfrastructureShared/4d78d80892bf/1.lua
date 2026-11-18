-- Threat: !InfrastructureShared
-- Name: 4d78d80892bf
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
  return mp.INFECTED
end
return mp.CLEAN
