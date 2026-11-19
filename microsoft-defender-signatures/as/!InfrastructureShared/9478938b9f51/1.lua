-- Threat: !InfrastructureShared
-- Name: 9478938b9f51
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
