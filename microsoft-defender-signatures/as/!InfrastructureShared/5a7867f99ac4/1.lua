-- Threat: !InfrastructureShared
-- Name: 5a7867f99ac4
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched and hstrlog[4].matched then
  return mp.INFECTED
end
return mp.CLEAN
