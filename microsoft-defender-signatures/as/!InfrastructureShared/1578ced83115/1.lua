-- Threat: !InfrastructureShared
-- Name: 1578ced83115
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 3000000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
