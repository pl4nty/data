-- Threat: !InfrastructureShared
-- Name: e478b8fd2905
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1572864 and mp.getfilesize() < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
