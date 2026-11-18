-- Threat: !InfrastructureShared
-- Name: 89781efec1c2
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 20000 then
  return mp.INFECTED
end
return mp.CLEAN
