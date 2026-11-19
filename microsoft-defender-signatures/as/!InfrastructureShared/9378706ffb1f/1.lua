-- Threat: !InfrastructureShared
-- Name: 9378706ffb1f
-- Type: 21

if hstrlog[6].matched and hstrlog[7].matched then
  return mp.CLEAN
end
return mp.INFECTED
