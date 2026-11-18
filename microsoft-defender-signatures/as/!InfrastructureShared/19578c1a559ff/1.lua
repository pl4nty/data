-- Threat: !InfrastructureShared
-- Name: 19578c1a559ff
-- Type: 21

if hstrlog[1].matched or hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
