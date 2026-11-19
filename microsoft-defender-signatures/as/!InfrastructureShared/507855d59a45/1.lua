-- Threat: !InfrastructureShared
-- Name: 507855d59a45
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched then
  return mp.INFECTED
end
return mp.CLEAN
