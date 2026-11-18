-- Threat: !InfrastructureShared
-- Name: 5c7880a99b5f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 16384 then
  return mp.INFECTED
end
return mp.CLEAN
