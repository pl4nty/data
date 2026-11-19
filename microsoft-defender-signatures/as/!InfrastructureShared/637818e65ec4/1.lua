-- Threat: !InfrastructureShared
-- Name: 637818e65ec4
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and not hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
