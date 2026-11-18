-- Threat: !InfrastructureShared
-- Name: 8a78d3b66108
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3198016 then
  return mp.INFECTED
end
return mp.CLEAN
