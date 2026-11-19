-- Threat: !InfrastructureShared
-- Name: 7378c052a8b0
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 142000 then
  return mp.INFECTED
end
return mp.CLEAN
