-- Threat: !InfrastructureShared
-- Name: 3d78e24c8691
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 1800000 then
  return mp.INFECTED
end
return mp.CLEAN
