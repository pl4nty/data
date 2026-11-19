-- Threat: !InfrastructureShared
-- Name: 2c787b68d776
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 5000000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
