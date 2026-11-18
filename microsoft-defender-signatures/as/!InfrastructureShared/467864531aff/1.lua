-- Threat: !InfrastructureShared
-- Name: 467864531aff
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 600000 and mp.getfilesize() < 700000 then
  return mp.INFECTED
end
return mp.CLEAN
