-- Threat: !InfrastructureShared
-- Name: 18141315c14eb
-- Type: 21

if mp.getfilesize() > 20480 then
  return mp.CLEAN
end
return mp.INFECTED
