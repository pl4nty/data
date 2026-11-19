-- Threat: !InfrastructureShared
-- Name: 4f781dab5075
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3198016 then
  return mp.INFECTED
end
return mp.CLEAN
