-- Threat: !InfrastructureShared
-- Name: 4778bd380d92
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 3000000 and mp.getfilesize() < 3300000 then
  return mp.INFECTED
end
return mp.CLEAN
