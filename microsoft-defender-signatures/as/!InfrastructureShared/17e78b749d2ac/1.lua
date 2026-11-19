-- Threat: !InfrastructureShared
-- Name: 17e78b749d2ac
-- Type: 21
-- Flags: 1

if hstrlog[1].matched or hstrlog[2].matched or hstrlog[3].matched and hstrlog[4].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched then
  return mp.INFECTED
end
return mp.CLEAN
