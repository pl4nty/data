-- Threat: !InfrastructureShared
-- Name: fe784fe4e5aa
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 15000000 then
  return mp.INFECTED
end
return mp.CLEAN
