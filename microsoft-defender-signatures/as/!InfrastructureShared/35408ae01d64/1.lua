-- Threat: !InfrastructureShared
-- Name: 35408ae01d64
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 1007952 then
  return mp.INFECTED
end
return mp.CLEAN
