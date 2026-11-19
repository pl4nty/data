-- Threat: !InfrastructureShared
-- Name: 1807826f87323
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
