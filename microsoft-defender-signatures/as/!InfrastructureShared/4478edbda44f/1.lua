-- Threat: !InfrastructureShared
-- Name: 4478edbda44f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 12000000 and mp.getfilesize() < 14000000 then
  return mp.INFECTED
end
return mp.CLEAN
