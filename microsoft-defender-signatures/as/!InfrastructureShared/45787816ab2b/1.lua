-- Threat: !InfrastructureShared
-- Name: 45787816ab2b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 200000 and mp.getfilesize() < 220000 then
  return mp.INFECTED
end
return mp.CLEAN
