-- Threat: !InfrastructureShared
-- Name: 2678d6b3f7c5
-- Type: 21
-- Flags: 1

if (hstrlog[1].VA < 16384 or hstrlog[2].matched) and mp.getfilesize() > 1024 and mp.getfilesize() < 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
