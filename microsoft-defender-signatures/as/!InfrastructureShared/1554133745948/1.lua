-- Threat: !InfrastructureShared
-- Name: 1554133745948
-- Type: 21

if mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
