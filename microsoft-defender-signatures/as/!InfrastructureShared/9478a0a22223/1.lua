-- Threat: !InfrastructureShared
-- Name: 9478a0a22223
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
