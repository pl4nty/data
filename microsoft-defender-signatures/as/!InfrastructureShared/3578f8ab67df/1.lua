-- Threat: !InfrastructureShared
-- Name: 3578f8ab67df
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
