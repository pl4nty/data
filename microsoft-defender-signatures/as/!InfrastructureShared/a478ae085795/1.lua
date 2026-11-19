-- Threat: !InfrastructureShared
-- Name: a478ae085795
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
