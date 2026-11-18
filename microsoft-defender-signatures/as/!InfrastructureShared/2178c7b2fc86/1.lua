-- Threat: !InfrastructureShared
-- Name: 2178c7b2fc86
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 150000 and mp.getfilesize() < 180000 then
  return mp.INFECTED
end
return mp.CLEAN
