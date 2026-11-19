-- Threat: !InfrastructureShared
-- Name: 7278412528a2
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
