-- Threat: !InfrastructureShared
-- Name: 2c7835a4fb8c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 7000 then
  return mp.INFECTED
end
return mp.CLEAN
