-- Threat: !InfrastructureShared
-- Name: a8788ed98773
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched and hstrlog[3].matched or hstrlog[4].matched and hstrlog[5].matched then
  return mp.INFECTED
end
return mp.CLEAN
