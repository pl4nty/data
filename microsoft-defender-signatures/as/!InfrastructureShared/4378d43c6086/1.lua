-- Threat: !InfrastructureShared
-- Name: 4378d43c6086
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 410000 and mp.getfilesize() < 430000 then
  return mp.INFECTED
end
return mp.CLEAN
