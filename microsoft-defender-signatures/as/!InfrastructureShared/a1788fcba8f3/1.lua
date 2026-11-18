-- Threat: !InfrastructureShared
-- Name: a1788fcba8f3
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 5198016 then
  return mp.INFECTED
end
return mp.CLEAN
