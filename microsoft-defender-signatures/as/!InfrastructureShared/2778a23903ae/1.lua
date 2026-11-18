-- Threat: !InfrastructureShared
-- Name: 2778a23903ae
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 100000 and hstrlog[1].matched then
  return mp.INFECTED
end
return mp.CLEAN
