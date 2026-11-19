-- Threat: !InfrastructureShared
-- Name: c878efc8c5ab
-- Type: 21

if hstrlog[8].matched or hstrlog[9].matched or hstrlog[10].matched or hstrlog[11].matched or hstrlog[12].matched then
  return mp.INFECTED
end
return mp.CLEAN
