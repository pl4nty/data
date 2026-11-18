-- Threat: !InfrastructureShared
-- Name: 3678f172b3bf
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 12400000 and mp.getfilesize() < 12800000 then
  return mp.INFECTED
end
return mp.CLEAN
