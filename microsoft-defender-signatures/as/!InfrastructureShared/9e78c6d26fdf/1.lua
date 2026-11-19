-- Threat: !InfrastructureShared
-- Name: 9e78c6d26fdf
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 3198016 then
  return mp.INFECTED
end
return mp.CLEAN
