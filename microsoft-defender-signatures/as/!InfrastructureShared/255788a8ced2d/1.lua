-- Threat: !InfrastructureShared
-- Name: 255788a8ced2d
-- Type: 21

if hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
