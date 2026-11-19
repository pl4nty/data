-- Threat: !InfrastructureShared
-- Name: 2378f713353f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 2100000 and mp.getfilesize() < 2300000 then
  return mp.INFECTED
end
return mp.CLEAN
