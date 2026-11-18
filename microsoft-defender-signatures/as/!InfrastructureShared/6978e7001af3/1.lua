-- Threat: !InfrastructureShared
-- Name: 6978e7001af3
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
