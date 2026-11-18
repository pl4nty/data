-- Threat: !InfrastructureShared
-- Name: 145783c0e1766
-- Type: 21

if hstrlog[1].matched and hstrlog[2].matched and hstrlog[3].matched and hstrlog[4].matched then
  return mp.INFECTED
end
return mp.CLEAN
