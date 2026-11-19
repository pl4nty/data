-- Threat: !InfrastructureShared
-- Name: 12578d6df86e1
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 33000 and mp.getfilesize() < 37000 then
  return mp.INFECTED
end
return mp.CLEAN
