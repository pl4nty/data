-- Threat: !InfrastructureShared
-- Name: 60780bf413f2
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 30000 and mp.getfilesize() >= 23000 then
  return mp.INFECTED
end
return mp.CLEAN
