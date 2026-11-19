-- Threat: !InfrastructureShared
-- Name: 43787813cc5e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
