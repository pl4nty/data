-- Threat: !InfrastructureShared
-- Name: 3678146b3295
-- Type: 21

if mp.getfilesize() < 7000 then
  return mp.INFECTED
end
return mp.CLEAN
