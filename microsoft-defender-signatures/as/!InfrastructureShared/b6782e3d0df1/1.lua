-- Threat: !InfrastructureShared
-- Name: b6782e3d0df1
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
