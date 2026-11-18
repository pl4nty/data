-- Threat: !InfrastructureShared
-- Name: ae781a4d9947
-- Type: 21

if hstrlog[2].matched or hstrlog[3].matched then
  return mp.INFECTED
end
return mp.LOWFI
