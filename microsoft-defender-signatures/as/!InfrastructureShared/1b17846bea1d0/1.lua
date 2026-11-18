-- Threat: !InfrastructureShared
-- Name: 1b17846bea1d0
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 4300000 and mp.getfilesize() < 4400000 then
  return mp.INFECTED
end
return mp.CLEAN
