-- Threat: !InfrastructureShared
-- Name: ac78d6779dd5
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3198016 then
  return mp.INFECTED
end
return mp.CLEAN
