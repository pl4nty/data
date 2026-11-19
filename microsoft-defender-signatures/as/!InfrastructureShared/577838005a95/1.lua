-- Threat: !InfrastructureShared
-- Name: 577838005a95
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 151554 then
  return mp.INFECTED
end
return mp.CLEAN
