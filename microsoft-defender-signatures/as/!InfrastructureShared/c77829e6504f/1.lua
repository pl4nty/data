-- Threat: !InfrastructureShared
-- Name: c77829e6504f
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched and hstrlog[6].matched then
  return mp.INFECTED
end
return mp.CLEAN
