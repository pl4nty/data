-- Threat: !InfrastructureShared
-- Name: e2781382c449
-- Type: 21

if hstrlog[1].matched and hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
