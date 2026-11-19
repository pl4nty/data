-- Threat: !InfrastructureShared
-- Name: df7855924fce
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
