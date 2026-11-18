-- Threat: !InfrastructureShared
-- Name: 687824f7d4d9
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched then
  return mp.INFECTED
end
return mp.CLEAN
