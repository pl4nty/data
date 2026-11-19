-- Threat: !InfrastructureShared
-- Name: 5d78197dd6fe
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
