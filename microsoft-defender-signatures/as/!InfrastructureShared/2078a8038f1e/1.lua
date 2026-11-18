-- Threat: !InfrastructureShared
-- Name: 2078a8038f1e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 240000 and mp.getfilesize() < 280000 then
  return mp.INFECTED
end
return mp.CLEAN
