-- Threat: !InfrastructureShared
-- Name: 10f7836a9dea7
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
