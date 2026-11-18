-- Threat: !InfrastructureShared
-- Name: 5f78164e1983
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1000000 and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
