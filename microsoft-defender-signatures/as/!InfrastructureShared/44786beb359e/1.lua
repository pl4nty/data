-- Threat: !InfrastructureShared
-- Name: 44786beb359e
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
