-- Threat: !InfrastructureShared
-- Name: 3578ab98df84
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
