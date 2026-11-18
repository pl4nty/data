-- Threat: !InfrastructureShared
-- Name: 193789fa4f1cf
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched or hstrlog[4].matched and hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched then
  return mp.INFECTED
end
return mp.CLEAN
