-- Threat: !InfrastructureShared
-- Name: 2178cadd8fb6
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
