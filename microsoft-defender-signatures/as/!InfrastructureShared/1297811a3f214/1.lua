-- Threat: !InfrastructureShared
-- Name: 1297811a3f214
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 2097152 and mp.getfilesize() > 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
