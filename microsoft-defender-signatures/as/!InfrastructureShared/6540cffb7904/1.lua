-- Threat: !InfrastructureShared
-- Name: 6540cffb7904
-- Type: 21

if mp.getfilesize() < 16384 then
  return mp.INFECTED
end
return mp.CLEAN
