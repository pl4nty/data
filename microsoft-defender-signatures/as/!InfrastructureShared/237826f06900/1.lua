-- Threat: !InfrastructureShared
-- Name: 237826f06900
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 38000000 and mp.getfilesize() < 39000000 then
  return mp.INFECTED
end
return mp.CLEAN
